<?php

namespace App\Modules\Admin\Controllers\Main;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Modules\Admin\Models\Main\MainGoals;
use App\Modules\Admin\Models\Main\MainGoalsData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class MainGoalsController extends Controller
{

    protected function index()
    {
        $main_goals = MainGoals::with([
            'Data' => function($query){

                $query->where('lang_id' , Lang::getSelectedLangId());
            },
            ])->get();

        if (request()->ajax()) {
            return DataTables::of($main_goals)
                ->editColumn('options', function ($query) {
                    $html = '';
                    if (Auth::user()->hasPermissionTo('Update_main_goals')) {

                        $html = "<a href='#' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-toggle='modal' data-target='#default-Modal' data-id='".$query->id."' data-url='".route('main_goals.edit', $query->id)."'>"._i('Edit')."</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Delete_main_goals')) {

                        $html .= "<a href='#' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='".$query->id."' data-url='".route('main_goals.delete', $query->id)."'>"._i('Delete')."</a>";
                    }
                    if (Auth::user()->hasPermissionTo('Lang_main_goals')) {

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

        return view('admin.main_goals.index');
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

            $path = public_path().'/uploads/main_goals';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/main_goals/'.$image_name;
        }
        $main_goals = MainGoals::create([
            'image' => $image_in_db,

        ]);

        $main_data = MainGoalsData::create([
            'main_goal_id' => $main_goals->id,
            'title' => $request->title,
            'description' => $request->description,
            'lang_id' =>  Lang::getSelectedLangId(),
        ]);

        $main_goals->save();

        return response()->json('success');
    }

    protected function edit($id)
    {
        $main_goals = MainGoals::findOrFail($id);
        $main_goals->image = asset($main_goals->image);
        return $main_goals;
    }//End of Edit

    protected function update(Request $request)
    {
        $main_goals = MainGoals::where('id' , $request->id)->first();

        if(! $request->image) {
            $image_in_db = $main_goals->image;
        } else {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $image_path = public_path($main_goals->image);
            if (file_exists(public_path($main_goals->image))) {
                unlink($image_path);
            }
            $path = public_path().'/uploads/main_goals';
            $image = request('image');
            $image_name = time().request('image')->getClientOriginalName();
            $image->move($path , $image_name);
            $image_in_db = '/uploads/main_goals/'.$image_name;
        }
        MainGoals::where('id' , $request->id)->update([
            'image'	=> $image_in_db,
        ]);


        $main_goals->save();

        return response()->json('success');
    }//End of Update

    public function getTranslation(Request $request)
    {
        $rowData = MainGoalsData::where('ads_id', $request->transRow)
            ->where('main_id', $request->main_id)
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
        $ads_data = MainGoalsData::query()
            ->where('main_id', $request->main_id)
            ->where('ads_id', $request->id)
            ->first();
        // dd($ads_data);
        if ($request->image) {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);
            $path = public_path() . '/uploads/main';
            $image = request('image');
            $image_name = time() . request('image')->getClientOriginalName();
            $image->move($path, $image_name);
            $image_in_db = '/uploads/main/' . $image_name;
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
            MainData::where([
                'main_id' => $request->id,
                'lang_id' => $request->lang_id,
            ])->update([
                'title' => $request->title,
                'image' => $image_in_db,
            ]);
        } else {

            MainData::create([
                'title' => $request->title,
                'image' => $image_in_db,
                'main_id' => $request->id,
                'lang_id' => $request->lang_id
            ]);
        }

        return \response()->json("SUCCESS");
    }

    public function delete($id)
    {
        $main_goals = MainGoals::where('id', $id)->first();
        $get_image_name = $main_goals->image;
        $image_path = public_path($get_image_name);
        if(File::exists($image_path)) {
            File::delete($image_path);
        }

        $main_goals->delete();
        MainGoalsData::where('main_goal_id' , $id)->delete();
        return response()->json('success');
    }
}
