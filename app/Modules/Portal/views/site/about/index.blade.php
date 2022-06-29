@extends('site.layout.index')

@section('title', _i('About'))

@section('content')

    <?php
        $images = \App\Bll\Site::get_default_images();
        $features = \App\Bll\Site::getFeatures();
        $site_settings = \App\Bll\Site::getSettingsData();

        $aboutSections = \App\Bll\Site::getContent()->whereIn('type', [ 'features', 'about1', 'about2', 'about3', 'about_services' ]);
        $about1 = $aboutSections->where('type', 'about1');
        $about2 = $aboutSections->where('type', 'about2');
        $about3 = $aboutSections->where('type', 'about3');
        $about_services = $aboutSections->where('type', 'features');
    ?>

    <section class="page-head" style="background-image: url('{{ asset('site/images/c927e9370e76dc14f5727aeeee648fa8.png') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Who Are We') }}</h3>
        </div>
    </section>

    @if (!$about1->isEmpty())
        <?php $about1 = $about1->first() ?>
        <section class="about-section about-us py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6  ">
                        <img src="{{ $about1->image }}" alt="" class="img-fluid w-100  rounded50 img-cover"
                             loading="lazy">
                    </div>
                    <div class="col-lg-6 justify-content-center d-md-flex flex-column">
                        <div class="small-title text-green-secondary fz21 fw-bold mt-2">{{ _i('Our Approach') }}</div>
                        <div class="section-title text-green-primary mt-2">{{ $about1->TranslatedData->title }}</div>
                        <p class="section-description mt-3">{{ $about1->TranslatedData->description }}</p>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if (!$about2->isEmpty())
        <?php $about2 = $about2->first() ?>
        <section class="about-section about-us py-5 bg-green-primary-faded ">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6 justify-content-center d-md-flex flex-column ">
                        <div class="small-title main-text-color fz21 fw-bold mt-2">{{ _i('Our Goal') }}</div>
                        <div class="section-title text-green-primary mt-2">{{ $about2->TranslatedData->title }}</div>
                        <p class="section-description mt-3">{{ $about2->TranslatedData->description }}</p>
                    </div>
        
                    <div class="col-lg-6  ">
                        <img src="{{ $about2->image }}" alt="" class="img-fluid w-100  rounded50 img-cover"
                             loading="lazy">
                    </div>
                </div>
            </div>
        </section>
    @endif
    
    @if (!$about3->isEmpty())
        <?php $about3 = $about3->first() ?>
        <section class="about-section about-us py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6  ">
                        <img src="{{ $about3->image }}" alt="" class="img-fluid w-100  rounded50 img-cover"
                             loading="lazy">
                    </div>
                    <div class="col-lg-6 justify-content-center d-md-flex flex-column">
                        <div class="small-title text-green-secondary fz21 fw-bold mt-2">{{ _i('Our Vision') }}</div>
                        <div class="section-title text-green-primary mt-2">{{ $about3->TranslatedData->title }}</div>
                        <p class="section-description mt-3">{{ $about3->TranslatedData->description }}</p>
                    </div>
                </div>
            </div>
        </section>
    @endif

    @if (!$about_services->isEmpty())
        <?php $about_services = $about_services->first() ?>
        <section class="features py-5 bg-light-blue">
            <div class="container">
                <div class="text-center w-50 mx-auto mb-5">
                    <div class="section-title mb-2">{{ $about_services->TranslatedData->title }}</div>
                    <p class="section-description">{{ $about_services->TranslatedData->description }}</p>
                </div>
                <div class="features-center-wrapper mt-5">
                    <div class="row ">
                        @include('site.includes.feature_tiles')
                    </div>
                </div>
            </div>
        </section>
    @endif


@endsection