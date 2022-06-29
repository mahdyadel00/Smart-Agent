@extends('site.layout.index')

@section('title', _i('Media'))

@section('content')

    <?php
    $images = \App\Bll\Site::get_default_images();
    $site_settings = \App\Bll\Site::getSettingsData();
    $medias = \App\Bll\Site::getMedia();
    ?>

    <section class="page-head" style="background-image: url('{{ asset('site/images/media-header-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Media') }}</h3>
        </div>
    </section>

    <section class="media-page-wrapper bg-light-blue py-5">
        <div class="container">
            <div class="row g-4">

                @foreach ($medias as $media)
                    @include('site.includes.media_tiles')
                @endforeach
                
            </div>
        </div>
    </section>
@endsection