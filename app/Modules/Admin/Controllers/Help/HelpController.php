<?php

namespace App\Modules\Admin\Controllers\Help;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Modules\Admin\Models\Help\Help;
use App\Modules\Admin\Models\Help\HelpData;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class HelpController extends Controller
{

    protected function index()
    {

        $help = Help::with([
            'data' => function ($query) {

                $query->where('lang_id', Lang::getSelectedLangId());
            },
        ])->get();
        if (request()->ajax()) {
            return DataTables::of($help)
                ->editColumn('options', function ($query) {
                    $html = '';
                    // if (Auth::user()->hasPermissionTo('Update_help')) {

                    $html .= "<a href='" . route('help.edit', $query->id) . "' class='btn waves-effect waves-light btn-success text-center edit-row mr-1 ml-1' data-id='" . $query->id . "'  data-title='" . $query->title . "'  data-description='" . $query->description . "' data-url='" . route('help.edit', $query->id) . "'>" . _i('Edit') . "</a>";
                    // }
                    // if (Auth::user()->hasPermissionTo('Delete_help')) {

                    $html .= "<a href='" . route('help.delete', $query->id) . "' class='btn btn-danger btn-delete datatable-delete mr-1 ml-1' data-id='" . $query->id . "'>" . _i('Delete') . "</a>";
                    // }
                    // if (Auth::user()->hasPermissionTo('Lang_help')) {

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
                    // }

                    return $html;
                })->editColumn('title', function ($query) {

                    // dd($query->data);
                    $data = $query->Data->where('lang_id', Lang::getSelectedLangId())->first();
                    if ($data != null) {

                        return $data->title;
                    } else {
                        $data = $query->data->first();
                        return $data->title;
                    }
                })->editColumn('published', function ($query) {
                    return $query->published == 1 ? _i('Published') : _i('Not Published');
                })->editColumn('image', function ($query) {
                    $image = asset(rawurlencode($query->image));
                    $html = "<img class='img-thumbnail' width=100 height=100 src=" . $query->getImageNameEncoded() . ">";
                    return $html;
                })->rawColumns([
                    'options',
                    'title',
                    'image',
                    'published',
                    'created_at',
                ])
                ->make(true);
        }

        return view('admin.help.index');
    } //End of Index

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
        return view('admin.help.create', compact('languages'));
    } // End of Create

    protected function store(Request $request)
    {

        if ($request->published) {

            $request->published = 1;
        } else {
            $request->published = 0;
        }
        if ($request->has('image')) {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $path = public_path() . '/uploads/helps';
            $image = request('image');
            $image_name = time() . request('image')->getClientOriginalName();
            $image->move($path, $image_name);
            $image_in_db = '/uploads/helps/' . $image_name;
        }

        $help = Help::create([
            'image' => $image_in_db,
            'published' => $request->published,

        ]);

        $help_data = HelpData::create([
            'help_id' => $help->id,
            'title' => $request->title,
            'description' => $request->description,
            'lang_id' => $request->lang_id,
        ]);

        $help->save();

        return redirect()->route('help.index')->with('flash_message', _i('Added Successfully !'));
    }

    protected function edit($id)
    {
        $help = Help::where('id', $id)->first();
        $help_data = HelpData::where('help_id', $help->id)->where('lang_id', Lang::getSelectedLangId())->first();
        return view('admin.help.edit', compact('help', 'help_data'));
    } //End of Edit

    protected function update(Request $request, $id)
    {
        if ($request->published) {
            $request->published = 1;
        } else {
            $request->published = 0;
        }
        $help = Help::where("id", $id)->first();


        if (!$request->image) {
            $image_in_db = $help->image;
        } else {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);

            $image_path = public_path($help->image);
            if (file_exists(public_path($help->image))) {
                unlink($image_path);
            }
            $path = public_path() . '/uploads/helps';
            $image = request('image');
            $image_name = time() . request('image')->getClientOriginalName();
            $image->move($path, $image_name);
            $image_in_db = '/uploads/helps/' . $image_name;
        }

        Help::where('id', $request->id)->update([
            'image'    => $image_in_db,
            'published' => $request->published
        ]);

        HelpData::where('help_id', $help->id)->update([

            'help_id' => $help->id,
            'title' => $request->title,
            'description' => $request->description,
            'lang_id' => Lang::getSelectedLangId(),
        ]);


        $help->save();


        return redirect()->route('help.index')->with('flash_message', _i('Updated Successfully !'));
    } //End of Update

    public function getTranslation(Request $request)
    {
        $rowData = HelpData::where('help_id', $request->transRow)
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
        $ads_data = HelpData::query()
            ->where('lang_id', $request->lang_id)
            ->where('help_id', $request->id)
            ->first();
        // dd($ads_data);
        if ($request->image) {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp',
            ]);
            $path = public_path() . '/uploads/helps';
            $image = request('image');
            $image_name = time() . request('image')->getClientOriginalName();
            $image->move($path, $image_name);
            $image_in_db = '/uploads/helps/' . $image_name;
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
            HelpData::where([
                'help_id' => $request->id,
                'lang_id' => $request->lang_id,
            ])->update([
                'title' => $request->title,
                'image' => $image_in_db,
            ]);
        } else {

            HelpData::create([
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
        $help = Help::where('id', $id)->first();
        $help->delete();
        $help_data = HelpData::where('help_id', $id)->delete();
        return redirect()->back()->with('flash_message', _i('Deleted Successfully !'));
    }
}
