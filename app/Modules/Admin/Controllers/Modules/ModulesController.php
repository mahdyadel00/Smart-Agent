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
use App\Modules\Admin\Models\Modules\Modules;
use App\Modules\Admin\Models\Modules\ModulesData;
use App\Modules\Admin\Models\Modules\ModulesContent;

class ModulesController extends Controller
{
    protected function index()
    {
        if (request()->ajax()) {
            // $modules = Modules::join('features_data', 'features.id', 'features_data.feature_id')
            //     ->where('features_data.lang_id' , Lang::getSelectedLangId())
            //     ->select('features.id', 'features_data.title', 'features.image', 'features.status', 'features.created_at')
            //     ->get();

            $modules = Modules::with([
                'content',
                'data' => function($query){

                    $query->where('lang_id' , Lang::getSelectedLangId());
                },
            ])->orderBy('id' , 'desc')->get();
           
                    return DataTables::of($modules)
                ->editColumn('options', function($query) {
                    $html = '';
                    if(Auth::user()->hasPermissionTo('Update_modules')){

                        $html = "<a href='#' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-toggle='modal' data-target='#default-Modal' data-id='".$query->id."' data-url='".route('modules.edit', $query->id)."'>"._i('Edit')."</a>";
                    }
                    if(Auth::user()->hasPermissionTo('Delete_modules')){

                        $html .= "<a href='#' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='".$query->id."' data-url='".route('modules.delete', $query->id)."'>"._i('Delete')."</a>";
                    }
                    if(Auth::user()->hasPermissionTo('Lnag_modules')){


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
                }
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
                })->editColumn('content_title', function($query) {
                    $content = $query->content->first();
                    
                    if ($content != null) {
                        return $content->title;
                    } else {
                        $content = $query->content->first();
                        return $content->title;
                    }        
                })->editColumn('status', function($query) {
                    if ($query->status == 0){
                        return '<div class="badge badge-warning">'. _i('Disabled') .'</div>';
                    }else {
                        return '<div class="badge badge-info">'. _i('Enabled') .'</div>';
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
        return view('admin.modules.index');
    }//End of Index

    protected function edit( $id )
    {
        $module = Modules::find($id);
        $module->image = asset($module->image);
        return $module;
    }//End Of Edit

    protected function store( Request $request )
    {
        // dd($request->all());
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

            $path = public_path().'/uploads/modules';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/modules/'.$image_name;
        }
        $video_in_db = NULL;
        if( $request->has('video') )
        {
            // $request->validate([
            //     'video' => 'mimetypes:video',

            // ]);

            $path = public_path().'/uploads/modules';
            $video = request('video');
            $video_name = time().request('video')->getClientOriginalName();
            $video->move($path , $video_name);
            $video_in_db = '/uploads/modules/'.$video_name;
        }

        $module = Modules::create([
            'image' => $image_in_db,
            'status' => $request->status,
        ]);
        // dd($module);
        ModulesData::create([
            'module_id' => $module->id,
            'lang_id' => Lang::getSelectedLangId(),
            'title' => $request->title,
            'body' => $request->body,
        ]);
        ModulesContent::create([
            'module_id' => $module->id,
            'title' => $request->content_title,
            'video' => $video_in_db,
        ]);
        return response()->json('success');
    }

    protected function update(Request $request)
    {
        if($request->status) {
            $request->status = 1;
        } else {
            $request->status = 0;
        }
        $module = Modules::where('id' , $request->id)->first();
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
            $path = public_path().'/uploads/modlues';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/modlues/'.$image_name;
        }
        $module_content = ModulesContent::where('module_id' , $module->id)->first();
        if(! $request->video) {
            $video_in_db = $module->video;
        } else {

            $video_path = public_path($module->video);
            if (file_exists(public_path($module->video))) {
                unlink($video_path);
            }
            $path = public_path().'/uploads/modlues';
            $video = request('video');
            $video_name = time().request('video')->getClientOriginalName();
            $video->move($path , $video_name);
            $video_in_db = '/uploads/modlues/'.$video_name;
        }

        Modules::where('id' , $request->id)->update([
            'image'	=> $image_in_db,
            'status' => $request->status
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
        $module = Modules::where('id', $id)->first();
        $get_image_name = $module->image;
        $image_path = public_path($get_image_name);
        if(File::exists($image_path)) {
            File::delete($image_path);
        }
        $get_video_name = $module->video;
        $video_path = public_path($get_video_name);
        if(File::exists($video_path)) {
            File::delete($video_path);
        }
        $module->delete();
        ModulesData::where('module_id' , $id)->delete();
        ModulesContent::where('module_id' , $id)->delete();
        return response()->json('success');

    }//End Of Delete


}
