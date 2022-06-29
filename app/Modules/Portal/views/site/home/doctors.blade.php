{{-- @dd($doctorsSection) --}}
<section class="team py-5">
    <div class="container">
        <div class="text-center lh-lg mb-5">
            <div class="section-title">{{ _i('Dental Experts') }}</div>
            <div class="title main-text-color fw-bold fz21">{{ $doctorsSection->TranslatedData->title }}</div>
            <p class="section-description w-50 mx-auto">{{ $doctorsSection->TranslatedData->description }}</p>
        </div>

        <div class="four-items-slider slider-gap" data-slick='{"rtl":@if (\App\Bll\Lang::getLangCode()== "ar") true @else false @endif,"arrows":true, "dots":false}'>
            @include('site.includes.doctor_tiles')
        </div>

        <div class="text-center">
            <a href="{{ route('doctors') }}" class="btn btn-green-primary">{{ _i('Get to know Aaji\'s medical team') }}</a>
        </div>
    </div>
</section>