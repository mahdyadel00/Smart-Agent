<section class="blog  bg-light-blue">
    <div class="container">
        <div class="text-center lh-lg mb-5">
            <div class="section-title">{{ _i('ِAaji\'s Blog') }}</div>
            <div class="title main-text-color fw-bold fz21">{{ $BlogsSection->TranslatedData->title }}</div>
            <p class="section-description w-50 mx-auto">{{ $BlogsSection->TranslatedData->description }}</p>
        </div>

        <div class="three-items-slider slider-gap" data-slick='{"rtl":@if (\App\Bll\Lang::getLangCode()== "ar") true @else false @endif,"arrows":true, "dots":false}'>
            
            {{-- Single blog --}}
            @foreach($blogs as $blog)
                @include('site.includes.blog_tiles')
            @endforeach

        </div>

        <div class="text-center">
            <a href="{{ route('allcategory') }}" class="btn btn-green-primary">{{ _i('More Blogs') }}</a>
        </div>
    </div>
</section>
