@extends('admin.layout.index',[
'title' => _i('All Questions Details'),
'activePageName' => _i('All Questions Details'),
'activePageUrl' => '',
'additionalPageUrl' => route('question_details.create') ,
'additionalPageName' => _i('Add'),
] )

@section('content')
    <div style="clear:both;"></div>
    <div class="box-body">
        <div class="row">
            @can('Create_question_details')
            <div class="col-sm-12 mb-3">
                <span class="pull-left">
                    <a href="{{ route('question_details.create') }}" class="btn btn-primary create add-permissiont"
                        type="button"><span><i class="ti-plus"></i> {{ _i('create new Questions Details ') }} </span></a>
                </span>
            </div>
            @endcan
            <div class="col-sm-12">
                <!-- Zero config.table start -->
                <div class="card">
                    <div class="card-header">
                        <h5>{{ _i('All Questions Details') }}</h5>
                        <div class="card-header-right">
                            <i class="icofont icofont-rounded-down"></i>
                        </div>
                    </div>
                    <div class="card-block">
                        <div class="dt-responsive table-responsive text-center">
                            <table id="dataTable" class="table table-bordered table-striped dataTable text-center">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting"> {{ _i('Title') }}</th>
                                        <th class="sorting"> {{ _i('Created At') }}</th>
                                        <th class="sorting"> {{ _i('Controll') }}</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade modal_create " id="langedit" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true" style="margin-top:40px;">
            <div class="modal-dialog" role="document">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="header"> {{ _i('Trans To') }} : </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="{{ route('questions.store.translation') }}" method="post" class="form-horizontal"
                                id="lang_submit" data-parsley-validate="">
                                {{ method_field('post') }}
                                {{ csrf_field() }}
                                <input type="hidden" name="id" id="id_data" value="">
                                <input type="hidden" name="lang_id" id="lang_id_data" value="">
                                <div class="box-body">
                                    <div class="form-group row">
                                        <label for="" class="col-sm-2 control-label "> {{ _i('Title') }} </label>
                                        <div class="col-md-10">
                                            <input type="text" placeholder="{{ _i('title') }}" name="title" value=""
                                                class="form-control{{ $errors->has('title') ? ' is-invalid' : '' }}"
                                                required="" id="titletrans">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">{{ _i('Image') }}</label>
                                        <div class="col-md-10">
                                            <input type="file" name="image" id="image" onchange="showImg(this)"
                                                class="btn btn-default" accept="image/gif, image/jpeg, image/png"
                                                value="{{ old('image') }}">
                                            <span class="text-danger invalid-feedback">
                                                <strong>{{ $errors->first('image') }}</strong>
                                            </span>
                                        </div>
                                        <div class="col-sm-6">
                                            <img class="img-responsive pad" id="old_img"
                                                style="margin-left:50px; height: 100px;width:100px" src="">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">{{ _i('Close') }}</button>
                                    <button type="submit" class="btn btn-primary">
                                        {{ _i('Save') }}
                                    </button>
                                </div>
                                <!-- /.box-footer -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @push('css')
        <style>
            .modal_create {
                margin: 2px auto;
                z-index: 1100 !important;
            }

        </style>
    @endpush
@endsection
@push('js')
    <script>
        $(function() {
            $('#dataTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('question_details.index') }}',
                columns: [{
                        data: 'title',
                        name: 'title'
                    },

                    {
                        data: 'created_at',
                        name: 'created_at'
                    },
                    {
                        data: 'options',
                        name: 'options',
                        orderable: false,
                        searchable: false
                    }
                ]
            });
        });


        $('body').on('click', '.lang_ex', function(e) {
            e.preventDefault();

            $('#lang_submit').find('textarea').val('');

            var transRowId = $(this).data('id');
            var lang_id = $(this).data('lang');
            // console.log(transRowId, lang_id);
            $.ajax({
                url: "{{ route('questions.get.translation') }}",
                method: "get",
                "_token": "{{ csrf_token() }}",
                data: {
                    'lang_id': lang_id,
                    'transRow': transRowId,

                },
                success: function(response) {
                    if (response.data == 'false') {


                        $('#titletrans').val('');
                        $('#old_img').val('');
                    } else {

                        $('#id_data').val(transRowId);
                        $('#lang_id_data').val(lang_id);
                        $('#titletrans').val(response.data.title);
                        $('#old_img').attr('src', response.data.image);

                    }
                }
            });

        });
        $('body').on('submit', '#lang_submit', function(e) {
            e.preventDefault();
            let url = $(this).attr('action');
            $.ajax({
                url: url,
                method: "post",
                "_token": "{{ csrf_token() }}",
                data: new FormData(this),
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.errors) {
                        $('#masages_model').empty();
                        $.each(response.errors, function(index, value) {
                            $('#masages_model').show();
                            $('#masages_model').append(value + "<br>");
                        });
                    }
                    if (response == 'SUCCESS') {
                        new Noty({
                            type: 'success',
                            layout: 'topRight',
                            text: "{{ _i('Translated Successfully') }}",
                            timeout: 2000,
                            killer: true
                        }).show();
                        $('.modal.modal_create').modal('hide');
                    }
                },
            });
        });
        $(document).ready(function() {
            $('#dataTable').on('click', '.btn-delete[data-remote]', function(e) {
                e.preventDefault();
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                var url = $(this).data('remote');
                $.ajax({
                    url: url,
                    type: 'DELETE',
                    dataType: 'json',
                    data: {
                        method: '_DELETE',
                        submit: true
                    }
                }).always(function(data) {
                    $('#dataTable').DataTable().draw(false);
                });
            });
        });
    </script>
@endpush
