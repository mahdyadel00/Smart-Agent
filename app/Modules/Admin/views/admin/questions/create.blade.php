@extends('admin.layout.index',[
'title' => _i('Add Questions'),
'subtitle' => _i('Add Questions'),
'activePageName' => _i('Add Questions'),
'activePageUrl' => '',
'additionalPageUrl' => route('questions.index') ,
'additionalPageName' => _i('All'),
] )

@section('content')
    <div class="page-body">
        <!-- Blog-card start -->
        <div class="card blog-page" id="blog">
            <div class="card-block">
                @include('admin.layout.swal')
                <form method='post' action="{{ route('questions.store') }}" class='form-group' data-parsley-validate>
                    @csrf
                    <!-- ---------------------------------------------** Language ** -------------------------------------------------------------- -->
                    <div class="form-group row">
                        <label for="title" class="col-sm-2 control-label">{{ _i('Language') }} <span
                                style="color: #F00;">*</span></label>
                        <div class="col-sm-10">
                            <select class="form-control" name="lang_id" id="language_addform" required="">
                                <option selected disabled="">{{ _i('CHOOSE') }}</option>
                                @foreach ($languages as $lang)
                                    <option value="{{ $lang->id }}">{{ $lang->title }}</option>
                                @endforeach
                            </select>
                            <small class="form-text text-muted">{{ _i('Please select language ') }}</small>
                        </div>
                    </div>
                    <!-- ---------------------------------------------** Title ** -------------------------------------------------------------- -->
                    
                    <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label"> {{ _i('Title') }} <span
                                style="color: #F00;">*</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="title" class='form-control'>
                            @if ($errors->has('title'))
                                <span class="text-danger invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('title') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <!-- ---------------------------------------------** checkbox Published ** -------------------------------------------------------------- -->
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label" for="checkbox">
                            {{ _i('Published') }}
                        </label>
                        <div class="checkbox-fade fade-in-primary col-sm-6">
                            <label>
                                <input type="checkbox" id="checkbox" name="published" value="1">
                                <span class="cr">
                                    <i class="cr-icon icofont icofont-ui-check txt-primary"></i>
                                </span>
                            </label>
                        </div>
                    </div>
                    <!-- ---------------------------------------------** checkbox Answer ** -------------------------------------------------------------- -->
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label" for="checkbox">
                            {{ _i('Answer') }}
                        </label>
                        <div class="checkbox-fade fade-in-primary col-sm-6">
                            <label>
                                <input type="checkbox" id="checkbox" name="answer" value="1">
                                <span class="cr">
                                    <i class="cr-icon icofont icofont-ui-check txt-primary"></i>
                                </span>
                            </label>
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
    @endsection
