<?php

namespace App\Modules\Admin\Controllers\QuizModule;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Modules\Admin\Models\QuizModule\QuizModule;
use App\Modules\Admin\Models\QuizModule\QuizModuleData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class QuizeModuleController extends Controller
{

    protected function index()
    {

        $quiz_module = QuizModule::with([
            'data' => function($query){

                $query->where('lang_id' , Lang::getSelectedLangId());
            },
            ])->get();
        if (request()->ajax()) {
            return DataTables::of($quiz_module)
                ->editColumn('options', function ($query) {
                    $html = '';
                    if (Auth::user()->hasPermissionTo('Update_quiz_module')) {

                        $html .= "<a href='" . route('quiz_module.edit', $query->id) . "' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-id='" . $query->id . "'  data-title='" . $query->title . "'  data-description='" . $query->description . "' data-url='" . route('quiz_module.edit', $query->id) . "'>" . _i('Edit') . "</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Delete_quiz_module')) {

                        $html .= "<a href='" . route('quiz_module.delete', $query->id) . "' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='" . $query->id . "'>" . _i('Delete') . "</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Lang_quiz_module')) {

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
               })->editColumn('answer', function($query) {
                   
                $data = $query->data->where('lang_id', Lang::getSelectedLangId())->first();
              
                if ($data->answer == 1) {

                    return _i('True');
                } else {
                    
                    return   _i('False');
                } 
           
            })->editColumn('published', function($query) {
                return $query->published == 1 ? _i('Published') : _i('Not Published');

            })->rawColumns([
                    'options',
                    'title',
                    'created_at',
                ])
                ->make(true);
        }

        return view('admin.quiz_module.index');
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
        return view('admin.quiz_module.create', compact('languages'));
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

            $path = public_path().'/uploads/quiz_module';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/quiz_module/'.$image_name;
        }
        $quiz_module = QuizModule::create([
            'image' => $image_in_db,
            'status' => $request->status,
        ]);
        
        $quiz_module_data = QuizModuleData::create([
            'quiz_id' => $quiz_module->id,
            'title' => $request->title,
            'description' => $request->description,
            'answer' => $request->answer ?? 0,
            'lang_id' => $request->lang_id,
        ]);

        $quiz_module->save();

        return redirect()->back()->with('flash_message', _i('Added Successfully !'));
        
    }

    protected function edit($id)
    {
        $quiz_module = QuizModule::where('id', $id)->first();
        $quiz_module_data = QuizModuleData::where('quiz_id', $quiz_module->id)->where('lang_id', Lang::getSelectedLangId())->first();
        return view('admin.quiz_module.edit', compact('quiz_module', 'quiz_module_data'));
    }//End of Edit

    protected function update(Request $request, $id)
    {
        
        $quiz_module = QuizModule::where("id", $id)->first();

        if ($request->has('status')) {

            $quiz_module->status = $request->status;
        } else {
            
            $quiz_module->status = 0;
        }

        $quiz_module_data = QuizModuleData::where('quiz_id', $quiz_module->id)->first();
       
        // dd($request->answer);
        if ($request->has('answer')) {

            $quiz_module_data->answer = $request->answer == 1;
        } else {
            $quiz_module_data->answer = 0;
        }       

        $quiz_module->save();
        $quiz_module_data->save();

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
        $quiz_module = QuizModule::where('id', $id)->first();
        $quiz_module->delete();
        $quiz_module_data = QuizModuleData::where('quiz_id', $id)->delete();
        return redirect()->back()->with('flash_message', _i('Deleted Successfully !'));
    }
}
