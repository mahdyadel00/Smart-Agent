<?php

namespace App\Modules\Admin\Controllers\Modules;

use App\Bll\Lang;
use App\Bll\Utility;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Yajra\DataTables\Facades\DataTables;
use App\Modules\Admin\Models\Modules\GoalsModules;
use App\Modules\Admin\Models\Modules\GoalsModulesData;

class GoalsModulesController extends Controller
{
    protected function index()
    {
        if (request()->ajax()) {
           
            $goals_modules = GoalsModules::with([
                'data' => function($query){

                    $query->where('lang_id' , Lang::getSelectedLangId());
                },
            ])->orderBy('id' , 'desc')->get();
           
                    return DataTables::of($goals_modules)
                ->editColumn('options', function($query) {
                    $html = '';
                    if(Auth::user()->hasPermissionTo('Update_goals')){

                        $html = "<a href='#' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-toggle='modal' data-target='#default-Modal' data-id='".$query->id."' data-url='".route('goals_modules.edit', $query->id)."'>"._i('Edit')."</a>";
                    }
                    if(Auth::user()->hasPermissionTo('Delete_goals')){

                        $html .= "<a href='#' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='".$query->id."' data-url='".route('goals_modules.delete', $query->id)."'>"._i('Delete')."</a>";
                    }


                    $langs = Language::get();
                    $options = '';
                    foreach ($langs as $lang) {
                        $options .= '<li ><a href="#" data-toggle="modal" data-target="#langedit" class="lang_ex" data-id="'.$query->id.'" data-lang="'.$lang->id.'"
						style="display: block; padding: 5px 10px 10px;">'.$lang->title.'</a></li>';
                    }
                    // $html = $html.'
					//  <div class="btn-group">
					//    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"  title=" '._i('Translation').' ">
					// 	 <span class="ti ti-settings"></span>
					//    </button>
					//    <ul class="dropdown-menu" style="right: auto; left: 0; width: 5em; " >
					// 	 '.$options.'
					//    </ul>
					//  </div> ';
                
                    return $html;
                })->editColumn('image', function($query) {
                    $image = asset(rawurlencode($query->image));
                    $html = "<img class='img-thumbnail' width=100 height=100 src=".$query->getImageNameEncoded().">";
                    return $html;
                })->editColumn('title', function($query) {
                    $data = $query->data->where('lang_id', Lang::getSelectedLangId())->first();
                    if ($data != null) {
    
                        return $data->title;
                    } else {
                        $data = $query->data->first();
                        return $data->title;
                    }        
                
                })->editColumn('created_at', function($query) {
                    return Utility::dates($query->created_at);
                })

                ->rawColumns([
                    'options',
                    'image',
                    'status',
                    'created_at'
                ])
                ->make(true);
        }
        return view('admin.goals_modules.index');
    }//End of Index

    protected function edit( $id )
    {
        $goal = GoalsModules::find($id);
        $goal->image = asset($goal->image);
        return $goal;
    }//End Of Edit

    protected function store( Request $request )
    {
    
        $image_in_db = NULL;
        if( $request->has('image') )
        {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $path = public_path().'/uploads/goals_modules';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/goals_modules/'.$image_name;
        }

        $goal = GoalsModules::create([
            'image' => $image_in_db,
        ]);
        GoalsModulesData::create([
            'goal_module_id' => $goal->id,
            'lang_id' => Lang::getSelectedLangId(),
            'title' => $request->title,
            'body' => $request->body,
        ]);
        return response()->json('success');
    }

    protected function update(Request $request)
    {
       
        $goal = GoalsModules::where('id' , $request->id)->first();
        if(! $request->image) {
            $image_in_db = $module->image;
        } else {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $image_path = public_path($module->image);
            if (file_exists(public_path($module->image))) {
                unlink($image_path);
            }
            $path = public_path().'/uploads/goals_modlues';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/goals_modlues/'.$image_name;
        }

        GoalsModules::where('id' , $request->id)->update([
            'image'	=> $image_in_db,
        ]);
        return response()->json('success');
    }
    protected function getTranslation(Request $request)
    {
        $rowData = ModulesData::where('feature_id', $request->transRow)
            ->where('lang_id', $request->lang_id)
            ->first(['title' , 'body']);
        if (!empty($rowData)){
            return response()->json(['data' => $rowData]);
        }else{
            return response()->json(['data' => false]);
        }
    }//EEnd Of Get Translation

    protected function storeTranslation(Request $request)
    {
        $rowData = ModulesData::where('module_id', $request->id)
            ->where('lang_id' , $request->lang_id)
            ->first();
        if ($rowData != null) {
            $rowData->update([
                'title' => $request->title,
                'body' => $request->body,
            ]);
        }else{
            ModulesData::create([
                'title'  => $request->title,
                'body'   => $request->body,
                'lang_id' => $request->lang_id,
                'module_id' => $request->id,
            ]);
        }
        return response()->json("SUCCESS");
    }//eEnd of Store Translation
    protected function delete($id)
    {
        $goal = GoalsModules::where('id', $id)->first();
        $get_image_name = $goal->image;
        $image_path = public_path($get_image_name);
        if(File::exists($image_path)) {
            File::delete($image_path);
        }
       
        $goal->delete();
        GoalsModulesData::where('goal_module_id' , $id)->delete();
        return response()->json('success');

    }//End Of Delete


}
