<section class="features py-5">
    <div class="container">
        <div class="text-center w-50 mx-auto mb-5">
            <div class="section-title mb-2">{{ $featuresSection->TranslatedData->title }}</div>
            <p class="section-description">{{ $featuresSection->TranslatedData->description }}</p>
        </div>
        <div class="features-center-wrapper mt-5">
            <div class="row ">
                
                @include('site.includes.feature_tiles')

            </div>
        </div>
    </div>
</section>