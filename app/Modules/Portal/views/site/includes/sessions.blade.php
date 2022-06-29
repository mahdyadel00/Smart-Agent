@if(session()->has('success'))
    <div class="container py-2">
        <div class="alert alert-success">
            <div class="btn btn-close" onclick="this.parentElement.style.display='none';"></div>
            <strong>{{_i('Success')}}!</strong> {{ session()->get('success') }}.
        </div>
    </div>
@endif
@if(session()->has('error'))
    <div class="container py-2">
        <div class="alert alert-danger">
            <div class="btn btn-close" onclick="this.parentElement.style.display='none';"></div>
            <strong>{{_i('Error')}}!</strong> {{ session()->get('error') }}.
        </div>
    </div>
@endif
