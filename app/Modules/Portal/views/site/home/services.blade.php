<section @if (Route::currentRouteName() == 'services')
            class="services py-5 bg-light-blue"
        @else
            class="home-page-services services py-5" 
        @endif>

    <div class="container">

        <div class="text-center w-50 mx-auto">
            <div class="section-title big-title mb-3">{{ $servicesSection->TranslatedData->title }}</div>
            <p class="section-description">{{ $servicesSection->TranslatedData->description }}</p>
        </div>

        @include('site.includes.service_tiles')

        @if (Route::currentRouteName() != 'services')
        <div class="text-center mt-5">
            <a href="{{ route('services') }}" class="btn btn-green-primary">{{ _i('Know more about our services') }}</a>
        </div>
        @endif

    </div>
</section>
