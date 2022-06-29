{{--<section class="clients  bg-light-blue">--}}
{{--    <div class="container">--}}
{{--        <div class="text-center d-grid justify-content-center lh-lg">--}}
{{--            <div class="small-title">{{ _i('Happy Customers') }}</div>--}}
{{--            <div class="section-title fancy-blue center-fancy">{{ _i('What People Say About Us') }} ?</div>--}}
{{--        </div>--}}
{{--        <div class="testimonials">--}}
{{--            <div class="three-items-slider slider-gap"--}}
{{--                 data-slick='@if(\App\Bll\Lang::getLangCode() == "ar") {"rtl":true, "arrows":false, "dots":true} @else {"rtl":false, "arrows":false, "dots":false} @endif'>--}}
{{--                @foreach ($reviews as $review)--}}
{{--                    <div class="single-item">--}}
{{--                        <div class="wrapper">--}}
{{--                            <div class="avatar"><img--}}
{{--                                    src="@if($review->user->image != null) {{asset('uploads/users/'.$review->user->id."/".$review->user->image)}} @else {{asset('website\web\img\user.png')}}  @endif"--}}
{{--                                    alt="" class="img-fluid" loading="lazy"></div>--}}

{{--                            <p> {{strip_tags( $review->comment)}}</p>--}}
{{--                            <div class="rate">--}}
{{--                                @if ($review->stars)--}}
{{--                                    @for ($i = 1; $i <= $review->stars; $i++)--}}
{{--                                        <i class="fa fa-star" style="color: #d9763d"></i>--}}
{{--                                    @endfor--}}
{{--                                @endif--}}
{{--                            </div>--}}
{{--                            <div class="name">{{ $review->user ? $review->user->name : '' }}</div>--}}
{{--                            <div class="job-title">{{ _i('Elswedy') }}</div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                @endforeach--}}
{{--            </div>--}}
{{--        </div>--}}

{{--    </div>--}}
{{--</section>--}}


<section class="clients  bg-light-blue">
    <div class="container">
        <div class="text-center d-grid justify-content-center lh-lg">
            <div class="small-title">{{ _i('Happy Customers') }}</div>
            <div class="section-title fancy-blue center-fancy">{{ _i('What People Say About Us') }} ?</div>
        </div>
        <div class="testimonials">
            <div class="three-items-slider slider-gap"
                 data-slick=@if(\App\Bll\Lang::getLangCode() == "ar") '{"rtl":true, "arrows":false, "dots":true}' @else '{"rtl":false, "arrows":false, "dots":true}' @endif>

                @foreach ($reviews as $review)
                <div class="single-item">
                    <div class="wrapper">
                        <div class="avatar">
                            @php
                                $img='/uploads/users/' . $review->user->id . '/' . $review->user->image;
                            @endphp
                            <img src="@if($review->user->image != null && \Illuminate\Support\Facades\File::exists(public_path($img)))
                                {{asset($img)}}
                                @else {{asset('website\web\img\user.png')}}  @endif"
                                alt="" class="img-fluid" loading="lazy"></div>

                        <p>{!! strip_tags( $review->comment) !!}</p>
                        <div class="rate rate-img">
                            @if ($review->stars)
                                @for ($i = 1; $i <= $review->stars; $i++)
                                    <i class="fa fa-star" style="color: #d9763d"></i>
                                @endfor
                            @endif
                        </div>
                        <div class="name">{{ $review->user ? $review->user->name : '' }}</div>
{{--                        <div class="job-title">Petro Rabigh Company</div>--}}
                    </div>
                </div>
                @endforeach

            </div>
        </div>

    </div>
</section>

