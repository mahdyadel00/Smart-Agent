<?php

namespace App\Modules\Admin\Controllers\Login;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Modules\Admin\Models\Login\Login;
use App\Modules\Admin\Models\Login\LoginData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class LoginController extends Controller
{

    protected function index()
    {
        $login = Login::with([
            'Data' => function($query){

                $query->where('lang_id' , Lang::getSelectedLangId());
            },
            ])->get();
        if (request()->ajax()) {
            return DataTables::of($login)
                ->editColumn('options', function ($query) {
                    $html = '';
                    if (Auth::user()->hasPermissionTo('Update_login')) {

                        $html = "<a href='#' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-toggle='modal' data-target='#default-Modal' data-id='".$query->id."' data-url='".route('login.edit', $query->id)."'>"._i('Edit')."</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Delete_login')) {

                        $html .= "<a href='#' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='".$query->id."' data-url='".route('login.delete', $query->id)."'>"._i('Delete')."</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Lang_login')) {

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
                
                $title = $query->Data->title ;
                    return $title;
                
            })->editColumn('image', function($query) {
                $image = asset(rawurlencode($query->image));
                $html = "<img class='img-thumbnail' width=100 height=100 src=".$query->getImageNameEncoded().">";
                return $html;

            })->rawColumns([
                    'options',
                    'image',
                    'title',
                    'created_at',
                ])
                ->make(true);
        }

        return view('admin.login.index');
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
   
    protected function store(Request $request)
    {
       
        $image_in_db = NULL;
        if( $request->has('image') )
        {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $path = public_path().'/uploads/login';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/login/'.$image_name;
        }
        $login = Login::create([
            'image' => $image_in_db,
           
        ]);
        
        $login_data = LoginData::create([
            'login_id' => $login->id,
            'title' => $request->title,
            'description' => $request->description,
            'lang_id' =>  Lang::getSelectedLangId(),
        ]);

        $login->save();

        return response()->json('success');        
    }

    protected function edit($id)
    {
        $login = Login::findOrFail($id);
        $login->image = asset($login->image);
        return $login;
    }//End of Edit

    protected function update(Request $request)
    {
        $login = Login::where('id' , $request->id)->first();
       
        if(! $request->image) {
            $image_in_db = $login->image;
        } else {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $image_path = public_path($login->image);
            if (file_exists(public_path($login->image))) {
                unlink($image_path);
            }
            $path = public_path().'/uploads/login';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/login/'.$image_name;
        }
        Login::where('id' , $request->id)->update([
            'image'	=> $image_in_db,
        ]);

    
        $login->save();

        return response()->json('success');        
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
        $login = Login::where('id', $id)->first();
        $get_image_name = $login->image;
        $image_path = public_path($get_image_name);
        if(File::exists($image_path)) {
            File::delete($image_path);
        }
        
        $login->delete();
        LoginData::where('login_id' , $id)->delete();
        return response()->json('success');
    }
}
