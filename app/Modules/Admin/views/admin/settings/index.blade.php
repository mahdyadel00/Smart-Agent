@extends('admin.layout.index',
[
'title' => _i('Settings'),
'subtitle' => _i('Settings'),
'activePageName' => _i('Settings'),
'activePageUrl' => route('settings.index'),
'additionalPageName' => '',
'additionalPageUrl' => route('settings.index') ,
])

@push('css')
    <style>
        .blog-page {
            margin: 43px;
            height: 200px;
        }

        h3 i {
            font-size: 45px !important;
        }

        .counter-card-1 [class*="card-"] div>i,
        .counter-card-2 [class*="card-"] div>i,
        .counter-card-3 [class*="card-"] div>i {
            font-size: 30px;
            color: #1abc9c !important;
        }

    </style>
@endpush

@section('content')
    <div class="page-body">
        <div class="row">
            <div class="col-md-12 col-xl-4">
                <div class="card counter-card-1">
                    <div class="card-block-big d-flex justify-content-between">
                        <div>
                            <h3><a href="{{ url('admin/settings/get') }}"
                                    class="text-primary">{{ _i('Basic Settings') }}</a></h3>
                            <p>{{ _i('Link, logo, name, location') }}</p>
                            <div class="progress ">
                                <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink"
                                    role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div>
                            <i class="icofont icofont-gear"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="hidden col-md-12 col-xl-4">
                <div class="card counter-card-1">
                    <div class="card-block-big d-flex justify-content-between">
                        <div>
                            <h3>
                                <a href="{{ url('/admin/all_users') }}" class="text-primary">{{ _i('Users') }}</a>
                            </h3>
                            <p>{{ _i('Control Users') }}</p>
                            <div class="progress ">
                                <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink"
                                     role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
                                     aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div>
                            <i class="icofont icofont-user"></i>
                        </div>
                    </div>
                </div>
            </div>
          
            <div class="col-md-12 col-xl-4">
                <div class="card counter-card-1">
                    <div class="card-block-big d-flex justify-content-between">
                        <div>
                            <h3>
                                <a href="{{ url('/admin/pages') }}" class="text-primary">{{ _i('Pages') }}</a>
                            </h3>
                            <p>{{ _i('Manage static pages') }}</p>
                            <div class="progress ">
                                <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink"
                                    role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
                                    aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div>
                            <i class="icofont icofont-page"></i>
                        </div>
                    </div>
                </div>
            </div>
           
         
            {{-- Sliders --}}
            <div class="col-md-12 col-xl-4">
                <div class="card counter-card-1">
                    <div class="card-block-big d-flex justify-content-between">
                        <div>
                            <h3>
                                <a href="{{ url('admin/settings/sliders') }}"
                                   class="text-primary">{{  _i('Sliders') }}</a>
                            </h3>
                            <p>{{ _i('Show sliders to customers in the Home Page') }}</p>
                            <div class="progress ">
                                <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink"
                                     role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0"
                                     aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div>
                            <i class="icofont icofont-files"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    {{-- <div class="page-header">
		<div class="page-header-title">
			<h4>{{_i('Content Sections')}}</h4>
		</div>
	</div>
	<div class="page-body">
		<div class="row"> --}}
    {{-- @can('Sections') --}}
    {{-- <div class="col-md-12 col-xl-4"> --}}
    {{-- <div class="card counter-card-1"> --}}
    {{-- <div class="card-block-big d-flex justify-content-between"> --}}
    {{-- <div> --}}
    {{-- <h3> --}}
    {{-- <a href="{{ route('section.index', 'home_sections') }}" --}}
    {{-- class="text-primary">{{  _i('Home Sections') }}</a> --}}
    {{-- </h3> --}}
    {{-- <p>{{ _i('Control Home Page Sections') }}</p> --}}
    {{-- <div class="progress "> --}}
    {{-- <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" --}}
    {{-- role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" --}}
    {{-- aria-valuemax="100"></div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- <div> --}}
    {{-- <i class="icofont icofont-pencil-alt-5"></i> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- @endcan --}}

    {{-- <div class="col-md-12 col-xl-4"> --}}
    {{-- <div class="card counter-card-1"> --}}
    {{-- <div class="card-block-big d-flex justify-content-between"> --}}
    {{-- <div> --}}
    {{-- <h3> --}}
    {{-- <a href="{{ route('section.index', 'categories_sections') }}" --}}
    {{-- class="text-primary">{{  _i('Categories Sections') }}</a> --}}
    {{-- </h3> --}}
    {{-- <p>{{ _i('Control Categories Page Sections') }}</p> --}}
    {{-- <div class="progress "> --}}
    {{-- <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" --}}
    {{-- role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" --}}
    {{-- aria-valuemax="100"></div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- <div> --}}
    {{-- <i class="icofont icofont-pencil-alt-5"></i> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}

    {{-- @can('Content management') --}}
    {{-- <div class="col-md-12 col-xl-4"> --}}
    {{-- <div class="card counter-card-1"> --}}
    {{-- <div class="card-block-big d-flex justify-content-between"> --}}
    {{-- <div> --}}
    {{-- <h3> --}}
    {{-- <a href="{{ url('/admin/content_management') }}" --}}
    {{-- class="text-primary">{{  _i('Content') }}</a> --}}
    {{-- </h3> --}}
    {{-- <p>{{ _i('Content Management') }}</p> --}}
    {{-- <div class="progress "> --}}
    {{-- <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" --}}
    {{-- role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" --}}
    {{-- aria-valuemax="100"></div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- <div> --}}
    {{-- <i class="icofont icofont-pencil-alt-5"></i> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- </div> --}}
    {{-- @endcan --}}

    {{-- </div>
	</div> --}}
@endsection
