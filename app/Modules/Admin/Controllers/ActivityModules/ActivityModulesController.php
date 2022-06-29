<?php

namespace App\Modules\Admin\Controllers\ActivityModules;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Modules\Admin\Models\ActivityModule\ActivityModule;
use App\Modules\Admin\Models\ActivityModule\ActivityModuleData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class ActivityModulesController extends Controller
{

    protected function index()
    {
        $avtivity_module = ActivityModule::with([
            'data' => function($query){

                $query->where('lang_id' , Lang::getSelectedLangId());
            },
            ])->get();
        if (request()->ajax()) {
            return DataTables::of($avtivity_module)
                ->editColumn('options', function ($query) {
                    $html = '';
                    if (Auth::user()->hasPermissionTo('Update_activity_modules')) {

                        $html .= "<a href='" . route('activity_modules.edit', $query->id) . "' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-id='" . $query->id . "'  data-title='" . $query->title . "'  data-description='" . $query->description . "' data-url='" . route('activity_modules.edit', $query->id) . "'>" . _i('Edit') . "</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Delete_activity_modules')) {

                        $html .= "<a href='" . route('activity_modules.delete', $query->id) . "' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='" . $query->id . "'>" . _i('Delete') . "</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Lang_activity_modules')) {

                        $langs = Language::get();
                        $options = '';
                        foreach ($langs as $lang) {
                            $options .= '<li ><a href="#" data-toggle="modal" data-target="#langedit" class="lang_ex"  data-id="' . $query->id . '" data-lang="' . $lang->id . '"
                            style="display: block; padding: 5px 10px 10px;">' . $lang->title . '</a></li>';
                        }
                        // $html = $html . '
                        // <div class="btn-group">
                        // <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"  title=" ' . _i('Translation') . ' ">
                        // <span class="ti ti-settings"></span>
                        // </button>
                        // <ul class="dropdown-menu" style="right: auto; left: 0; width: 5em; " >
                        // ' . $options . '
                        // </ul>
                        // </div> ';
                    }

                    return $html;
          
             })->editColumn('title', function ($query) {
                
                $data = $query->data->where('lang_id', Lang::getSelectedLangId())->first();
                if ($data != null) {

                    return $data->title;
                } else {
                    $data = $query->data->first();
                    return $data->title;
                }         
            })->editColumn('image', function($query) {
                $image = asset(rawurlencode($query->image));
                $html = "<img class='img-thumbnail' width=100 height=100 src=".$query->getImageNameEncoded().">";
                return $html;
            })->editColumn('status', function($query) {
                return $query->status == 1 ? _i('Published') : _i('Not Published');

            })->rawColumns([
                    'options',
                    'title',
                    'created_at',
                ])
                ->make(true);
        }

        return view('admin.avtivity_module.index');
    }//End of Index

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected function create()
    {
        $languages = Language::get();
        return view('admin.avtivity_module.create', compact('languages'));
    }// End of Create

    protected function store(Request $request)
    {
        if($request->status) {
           
            $request->status = 1;
        } else {
            $request->status = 0;
        }
        $image_in_db = NULL;
        if( $request->has('image') )
        {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $path = public_path().'/uploads/avtivity_module';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/avtivity_module/'.$image_name;
        }
        $avtivity_module = ActivityModule::create([
            'image' => $image_in_db,
            'status' => $request->status,
        ]);
        
        $avtivity_module_data = ActivityModuleData::create([
            'activity_id' => $avtivity_module->id,
            'title' => $request->title,
            'description' => $request->description,
            'lang_id' => $request->lang_id,
        ]);

        $avtivity_module->save();

        return redirect()->route('activity_modules.index')->with('flash_message', _i('Added Successfully !'));
        
    }

    protected function edit($id)
    {
        $avtivity_module = ActivityModule::where('id', $id)->first();
        $avtivity_module_data = ActivityModuleData::where('quiz_id', $avtivity_module->id)->where('lang_id', Lang::getSelectedLangId())->first();
        return view('admin.avtivity_module.edit', compact('avtivity_module', 'avtivity_module_data'));
    }//End of Edit

    protected function update(Request $request, $id)
    {
        
        $avtivity_module = ActivityModule::where("id", $id)->first();

        if ($request->has('status')) {

            $avtivity_module->status = $request->status;
        } else {
            
            $avtivity_module->status = 0;
        }

        $avtivity_module_data = ActivityModuleData::where('quiz_id', $avtivity_module->id)->first();
       
        // dd($request->answer);
        if ($request->has('answer')) {

            $avtivity_module_data->answer = $request->answer == 1;
        } else {
            $avtivity_module_data->answer = 0;
        }       

        $avtivity_module->save();
        $avtivity_module_data->save();

        return redirect()->back()->with('flash_message', _i('Updated Successfully !'));
    }//End of Update

    public function getTranslation(Request $request)
    {
        $rowData = QuestionData::where('ads_id', $request->transRow)
            ->where('lang_id', $request->lang_id)
            ->first(['title', 'image']);
        if (!empty($rowData)) {
            $rowData->image = asset($rowData->image);
            return \response()->json(['data' => $rowData]);
        } else {
            return \response()->json(['data' => false]);
        }
    }

    public function storeTranslation(Request $request)
    {
        $ads_data = QuestionData::query()
            ->where('lang_id', $request->lang_id)
            ->where('ads_id', $request->id)
            ->first();
        // dd($ads_data);
        if ($request->image) {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);
            $path = public_path() . '/uploads/advrtisment';
            $image = request('image');
            $image_name = time() . request('image')->getClientOriginalName();
            $image->move($path, $image_name);
            $image_in_db = '/uploads/advrtisment/' . $image_name;
        } else {
            $image_in_db = null;
        }

        if ($ads_data) {
            if ($image_in_db == null) {
                $image_in_db = $ads_data->image;
            } else {

                $image_path = public_path($ads_data->image);
                if (file_exists(public_path($ads_data->image))) {
                    unlink($image_path);
                }
            }
            QuestionData::where([
                'ads_id' => $request->id,
                'lang_id' => $request->lang_id,
            ])->update([
                'title' => $request->title,
                'image' => $image_in_db,
            ]);
        } else {

            QuestionData::create([
                'title' => $request->title,
                'image' => $image_in_db,
                'ads_id' => $request->id,
                'lang_id' => $request->lang_id
            ]);
        }

        return \response()->json("SUCCESS");
    }

    public function delete($id)
    {
        $avtivity_module = ActivityModule::where('id', $id)->first();
        $avtivity_module->delete();
        $avtivity_module_data = ActivityModuleData::where('avtivity_module', $id)->delete();
        return redirect()->back()->with('flash_message', _i('Deleted Successfully !'));
    }
}
