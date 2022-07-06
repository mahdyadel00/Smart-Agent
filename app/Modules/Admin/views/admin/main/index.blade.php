@extends('admin.layout.index',
[
	'title' => _i('Main'),
	'subtitle' => _i('Main'),
	'activePageName' => _i('Main'),
	'activePageUrl' => route('main_page.index'),
	'additionalPageName' =>  _i('Main'),
	'additionalPageUrl' => route('main_page.index')
])
@section('content')
<div class="box-body">
	<div class="row">
        @can('Create_main')
		<div class="col-sm-12 mb-3">
			<span class="pull-left">
			<button class="btn btn-primary create add-permissiont" type="button" data-toggle="modal"
				data-target="#modal-default">
				<span><i class="ti-plus"></i> {{_i('Create new Main')}} </span>
			</button>
			</span>
		</div>
        @endcan
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>{{_i('Main')}}</h5>
					<div class="card-header-right">
						<i class="icofont icofont-rounded-down"></i>
						<i class="icofont icofont-refresh"></i>
						<i class="icofont icofont-close-circled"></i>
					</div>
				</div>
				<div class="card-block">
					<div class="dt-responsive table-responsive text-center">
						<table id="slider_table" class="table table-bordered table-striped dataTable text-center">
							<thead>
								<tr role="row">
									<th>#</th>
									<th>{{ _i('title') }}</th>
									<th>{{ _i('Image ') }}</th>
									<th>{{ _i('Created at') }}</th>
									<th>{{ _i('Options') }}</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@include('admin.main.modal')
@endsection
@push('js')
<script>
	var table = $('.dataTable').DataTable({
		order: [],
		processing: true,
		serverSide: true,
		ajax: '{{route('main_page.index')}}',
		columns: [
			{data: 'id', name: 'id'},
			{data: 'title', name: 'title'},
			{data: 'image', name: 'image'},
			{data: 'created_at', name: 'created_at'},
			{data: 'options', name: 'options', orderable: true, searchable: true}
		]
	});

	$(document).on('click', '.edit-row', function()
	{
		var url = $(this).data('url');
        let id = $(this).data('id')
        $('#modal-id').val(id)
		$.ajax({
			url: url,
			method: "get",
			success: function (response) {
				$('#modal-id').val(response.id)
				$('#image_service').attr("src", response.image);
				console.log(response.status);
				if(response.status == 1){
					$('.status').prop('checked',true);
				}
				else
				{
					$('.status').prop('checked',false);
				}
			}
		});
	});

	$('body').on('submit', '#add-form', function (e)
	{
		e.preventDefault();
		var url = $(this).attr('action');
		$.ajax({
			url: url,
			method: "post",
			data: new FormData(this),
			dataType: 'json',
			cache       : false,
			contentType : false,
			processData : false,
			success: function (response) {
				if( response == 'success' )
				{
					new Noty({
						type: 'success',
						layout: 'topRight',
						text: "{{ _i('Saved successfully')}}",
						timeout: 2000,
						killer: true
					}).show();
					$('.modal').modal('hide');
					$('.dataTable').DataTable().draw(false);
				}
			},
		});
	});

	$('body').on('submit', '#edit-form', function (e)
	{
		e.preventDefault();
		let url = "{{ route('main_page.update') }}";
		$.ajax({
			url: url,
			method: "post",
			data: new FormData(this),
			dataType: 'json',
			cache       : false,
			contentType : false,
			processData : false,
			success: function (response) {
				if( response == 'success' )
				{
					new Noty({
						type: 'success',
						layout: 'topRight',
						text: "{{ _i('Updated successfully')}}",
						timeout: 2000,
						killer: true
					}).show();
					$('.modal').modal('hide');
					$('.dataTable').DataTable().draw(false);
				}
			},
		});
	});

    $('body').on('click', '.btn-delete', function (e)
	{
        var rowId = $(this).data('id');
       // console.log(rowId)
		e.preventDefault();
		var url = $(this).data('url');
       // alert(url);
		$.ajax({
			url: url,
			type: 'get',
			dataType: 'json',
			data: {id: rowId},
            success: function (response) {
                if( response == 'success' )
                {
                    new Noty({
                        type: 'success',
                        layout: 'topRight',
                        text: "{{ _i('Deleted successfully')}}",
                        timeout: 2000,
                        killer: true
                    }).show();
                    $('.modal').modal('hide');
                    $('.dataTable').DataTable().draw(false);
                }
            },
		})
	});

	$('body').on('click', '.lang_ex', function (e) {
		e.preventDefault();
		var transRowId = $(this).data('id');
		var lang_id = $(this).data('lang');
    //    alert(transRowId);
		$.ajax({
			url: '{{route('main_page.get.translation')}}',
			method: "get",
			"_token": "{{ csrf_token() }}",
			data: {
				'lang_id': lang_id,
				'transRow': transRowId,
			},
			success: function (response) {
				if (response.data == 'false'){
					$('#langedit input[name="title"]').val('');
					$('#langedit textarea[name="body"]').val('');
					// CKEDITOR.instances.editor1.setData('');
				} else{
					$('#langedit input[name="title"]').val(response.data.title);
					$('#langedit textarea[name="body"]').val(response.data.body);
					// CKEDITOR.instances.editor1.setData(response.data.body);
					$('#id_data').val(transRowId);
					$('#lang_id_data').val(lang_id);
				}
			}
		});

        // get lang title


	});

	$('body').on('submit', '#lang_submit', function (e)
	{
		e.preventDefault();
		let url = $(this).attr('action');
		$.ajax({
			url: url,
			method: "post",
			"_token": "{{ csrf_token() }}",
			data: new FormData(this),
			dataType: 'json',
			cache       : false,
			contentType : false,
			processData : false,
			success: function (response) {
				if (response.errors){
					$('#masages_model').empty();
					$.each(response.errors, function(index, value) {
						$('#masages_model').show();
						$('#masages_model').append(value + "<br>");
					});
				}
				if (response == 'SUCCESS'){
					new Noty({
						type: 'success',
						layout: 'topRight',
						text: "{{ _i('Translated Successfully')}}",
						timeout: 2000,
						killer: true
					}).show();
					$('.dataTable').DataTable().draw(false);
					$('.modal.modal_create').modal('hide');
				}
			},
		});
	});


</script>
@endpush
