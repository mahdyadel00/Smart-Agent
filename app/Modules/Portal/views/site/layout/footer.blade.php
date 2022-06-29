{{-- @dd($site_settings) --}}
<footer>
    <div class="footer-wrapper  ">
        <div class="container">
            <div class="row">
                <div class="col-lg-3  col-md-6">
                    <div>
                        <img alt="" class="img-fluid" loading="lazy"
                            src="@if ($images->footer != null) {{ asset($images->footer) }} @else {{ asset('site/images/Logo.webp') }} @endif">
                    </div>
                    <p class="footer-brief my-2 lh-lg">{{ $site_settings['description'] }}</p>
                    <ul class="list-inline social-list mt-3">
                        <li class="list-inline-item"><a href="{{ $site_settings['facebook_url'] }}"><i
                                    class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings['twitter_url'] }}"><i
                                    class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings['youtube_url'] }}"><i
                                    class="fab fa-youtube"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings['instagram_url'] }}"><i
                                    class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
                <div class="col-lg-4 row">
                    <div class="">
                        {{-- <h6>Company</h6> --}}
                        <ul class="list-unstyled footer-nav">
                                <li><a href="#"></a>
                                </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h6>{{_i('Subscribe')}}</h6>
                    <p>{{_i('Subscribe to the newsletter to receive our offers and all new')}}.</p>
                    <form class="subscribe-form" id="subscribeForm" data-validate="parsley">
                        <input type="email" placeholder="{{ _i('Your Email Address') }}" class="form-control"
                            data-parsley-type="email">
                        {{-- <button type="submit"  class='subscribe-btn'>{{ _i('Subscribe') }}</button> --}}
                        <input type="submit" class="btn-submit btn btn-green-secondary subscribe-btn" value="Subscribe">
                    </form>
                </div>
            </div>
        </div>
        <div class="copyrights">
            <div class="container">
                <div class="d-md-flex justify-content-between">
                    <p class="cp"><a href="http://www.serv5.com" target="_blank">Serv5.com </a></p>
                    <p>{{ _i('Copyright') }} © {{ date('Y') }}. {{ _i('All rights reserved') }}.</p>
                </div>
            </div>
        </div>
    </div>
</footer>
