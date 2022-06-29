@extends('site.layout.index')

@section('content')
    <?php
        $settings = \App\Bll\Site::getSettings();
        $sliders = \App\Bll\Site::getSlider();
        $images = \App\Bll\Site::get_default_images();
        $site_settings = \App\Bll\Site::getSettingsData();

    ?>

    
@endsection
