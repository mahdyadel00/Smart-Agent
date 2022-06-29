<section class="header-slider">
    <div class="one-item-slider hero-slider" data-slick='{"rtl":@if (\App\Bll\Lang::getLangCode()== "ar") true @else false @endif, "arrows":true, "dots":false}'>
        @foreach ($sliders as $slider)
        <div class="single-hero-slide" style="background-image: url('{{ $slider->image }}');">
            <div class="container">
                <div class=" slide-caption">
                    <div class="titles">
                        <h4 class="slide-title">{{ $slider->Data[0]->name }}</h4>
                        <p class="slider-description ">{{ $slider->Data[0]->description }}</p>
                    </div>
                    <div class="">
                        <a href="{{ route('contact') }}" class="btn btn-green-secondary mt-2"> <i class="far fa-calendar-day"></i> {{ _i('Reserve an Appointment') }}
                        </a>
                        @if ( \App\Bll\Utility::getYoutubeID($slider->url) != null )
                            <a data-bs-toggle="modal" data-bs-target="#videoModal{{ $slider->id }}" class="btn btn-green-primary mt-2"> <i
                                    class="fas fa-play-circle"></i> {{ _i('Learn more about us') }}
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</section>


@foreach ($sliders as $slider)

<!-- Video Modal -->
<div class="modal fade" id="videoModal{{ $slider->id }}" tabindex="-1" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <iframe src="http://www.youtube.com/embed/{{ \App\Bll\Utility::getYoutubeID($slider->url) }}" title="YouTube video player" frameborder="0"
                        allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </div>

        </div>
    </div>
</div>
<!-- end header-slider -->
@endforeach