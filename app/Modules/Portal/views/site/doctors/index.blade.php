@extends('site.layout.index')

@section('title', _i('Doctors'))

@section('content')

    <?php
        $images = \App\Bll\Site::get_default_images();
        $doctors = \App\Bll\Site::getDoctors();
        $site_settings = \App\Bll\Site::getSettingsData();

        $doctorsSection = \App\Bll\Site::getContent()->where('type', 'doctors');
    ?>

    <section class="page-head" style="background-image: url({{ asset('site/images/team-head-img.jpg') }});">
        <div class="container">
            <div class="d-md-flex justify-content-between z-index position-relative">
                <h3 class="page-title">{{ _i('Doctors') }}</h3>
            </div>
        </div>
    </section>

    

    <section class="media-page-wrapper bg-light-blue py-5">
        <div class="container">
            <div class="row g-4">

                @include('site.includes.doctor_tiles')
                
            </div>
        </div>
    </section>

@endsection