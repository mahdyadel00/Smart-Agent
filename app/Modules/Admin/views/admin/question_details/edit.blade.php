@extends('admin.layout.index',[
'title' => _i('Edit Questions Details'),
'subtitle' => _i('Edit Questions Details'),
'activePageName' => _i('Edit Questions Details'),
'activePageUrl' => '',
'additionalPageUrl' => route('question_details.index') ,
'additionalPageName' => _i('All'),
] )

@section('content')
    <div class="page-header">
        <div class="page-header-title">
        </div>
        <div class="page-header-breadcrumb">
            <ul class="breadcrumb-title">
                <li class="breadcrumb-item">
                    <a href="javascript:void(0)">
                        <i class="icofont icofont-home"></i>
                    </a>
                </li>
                <li class="breadcrumb-item"><a href="{{ route('question_details.index') }}">{{ _i('Questions Details') }}</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- Page-header end -->
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Blog-card start -->
        <div class="card blog-page" id="blog">
            <div class="card-block">
                @include('admin.layout.swal')
                <form method='post' action="{{ route('question_details.update', $question_details->id) }}" class='form-group' data-parsley-validate>
                    @csrf
                    @method('POST')
                    <!-- ---------------------------------------------** checkbox Published ** -------------------------------------------------------------- -->

                    <div class="form-group row">
                        <label class="col-sm-1 col-form-label" for="checkbox">
                            {{ _i('Published') }}
                        </label>
                        <div class="checkbox-fade fade-in-primary col-sm-6">
                            <label>
                                <input type="checkbox" id="checkbox" name="published" value="1"
                                    {{ $question_details->published == 1 ? 'checked' : '' }}>
                                <span class="cr">
                                    <i class="cr-icon icofont icofont-ui-check txt-primary"></i>
                                </span>
                            </label>
                        </div>
                    </div>

                    <!-- ---------------------------------------------** Title ** -------------------------------------------------------------- -->

                     <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label"> {{ _i('Title') }}</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" class='form-control' value='{{ $question_details->title }}'>
                            @if ($errors->has('title'))
                                <span class="text-danger invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                     <!-- ---------------------------------------------** Description ** -------------------------------------------------------------- -->
                     <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label"> {{ _i('Description') }} <span
                                style="color: #F00;">*</span></label>
                        <div class="col-sm-10">
                            <textarea name="description" id="" cols="30" rows="10" class="form-control">{{ $question_details->description }}</textarea>
                            @if ($errors->has('description'))
                                <span class="text-danger invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('description') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-2">
                            <button type="submit" class="btn btn-primary pull-leftt"> {{ _i('Save') }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

