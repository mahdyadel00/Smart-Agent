    {{--
    <section class="hero-header">

        <!-- Hero slider -->
        <div class="one-item-slider hero-slider" data-slick='@if(\App\Bll\Lang::getLangCode() == "ar"){"rtl":true}@else{"rtl":false}@endif'> <!-- Change RTL to TRUE if language is Arabic -->

            @foreach($services as $service)

            <div class="single-hero-slide"
                style="background: linear-gradient(0deg, rgba(26,107,185,0.78), rgba(26,107,185,0.78)),url('{{asset( $service['image']??'site/images/hero-bg.webp')}}') ;">
                <div class="container">
                    <div class=" slide-caption">

                        <h4 class="slide-title">
                        {{$service['title']}}
                        </h4>
                        <p class="slider-description ">{!! strip_tags( str_limit($service['body'], 70)) !!}</p>
                        <a href="#" class="btn btn-orange">{{_i('Shop Now')}}</a>

                    </div>
                </div>

            </div>
            @endforeach


        </div>
        <!-- End Hero slider -->

        <!-- Hero slider Thumbnails indicators -->

        <!---------------------------------- services section start -------------------->
        <div class="container">
            <div class="hero-nav slider-gap" data-slick='@if(\App\Bll\Lang::getLangCode() == "ar"){"rtl":true}@else{"rtl":false}@endif'>

                @foreach($services as $service)
                    <div class="single-slide-nav">
                        <div class="wrapper">
                            <div class="thumbnail">
                                <img href="#" src="{{asset($service->image)}}" alt="" class="img-fluid" loading="lazy">
                            </div>
                            <div class="p-4 text-center">
                                <h3 class="title">{{str_limit($service->title, 50)}}</h3>
                                <p class="description">{!! strip_tags( str_limit($service->body, 70)) !!}</p>
                                <div class="btns">
                                    <a href="#" class="btn btn-orange"><i class="fas fa-chevron-right"></i></a>
                                    <a href="#" class="btn btn-blue px-3">{{_i('Read More')}}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <!-- End Hero slider Thumbnails indicators -->
    </section>  --}}
