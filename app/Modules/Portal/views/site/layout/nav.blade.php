<header>
    <div class="top-nav">
        <div class="container">
            <div class="row">
                <div class="col-lg-9  align-self-center ">
                    <ul
                        class="list-unstyled top-info d-flex align-items-center  justify-content-center justify-content-lg-start  ">
                        <li class="d-none d-md-inline-block"><i class="far fa-clock"></i>
                            {{ $site_settings->working_hours }}
                        </li>
                        <li>
                            <i class="fas fa-phone-alt"></i>
                            {{ $site_settings->phone1 }}
                        </li>
                        <li class="d-none d-md-inline-block"><i class="fas fa-envelope"></i>
                            {{ $site_settings->email }}
                        </li>
                        @php
                            $lang_selected = \App\Bll\Lang::getSelectedLang();
                            $langs = \App\Bll\Lang::getLanguages();
                        @endphp
                        @foreach ($langs as $lang)
                            @if ($lang->code != $lang_selected->code)
                                <li class="d-md-none">
                                    <a href="{{ route('change_language', $lang->code) }}" class="text-white">

                                        <i class="fas fa-globe"></i>
                                        {{ $lang->title }}

                                    </a>
                                </li>
                            @endif
                        @endforeach
                    </ul>
                </div>
                <div class="col-lg-3 d-flex align-items-center justify-content-md-end justify-content-center gap-4 ">
                    <ul class="list-inline social-list ">
                        <li class="list-inline-item"><a href="{{ $site_settings->facebook_url }}"><i
                                    class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings->twitter_url }}"><i
                                    class="fab fa-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings->youtube_url }}"><i
                                    class="fab fa-youtube"></i></a></li>
                        <li class="list-inline-item"><a href="{{ $site_settings->instagram_url }}"><i
                                    class="fab fa-instagram"></i></a></li>
                    </ul>
                    <ul class="list-inline d-none d-md-inline-block">
                        @php
                            $lang_selected = \App\Bll\Lang::getSelectedLang();
                            $langs = \App\Bll\Lang::getLanguages();
                        @endphp
                        @foreach ($langs as $lang)
                            @if ($lang->code != $lang_selected->code)
                            <a href="{{ route('change_language', $lang->code) }}">
                                <li>
                                    <i class="fas fa-globe"></i>
                                    {{ $lang->title }}
                                </li>
                            </a>
                            @endif
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- main-header-content -->
<div class="main-header-content position-sticky">
    <div class="shadow">
        <div class="container">
            <div class="row py-3 nav-row">
                <div class="col-xxl-2 col-lg-2 ">
                    <div class="logo">
                        <a class="d-block" href="{{ route('home') }}"><img alt="Site logo"
                                class="img-fluid" loading='lazy' src="{{ asset('victor/logo.png') }}"></a>
                    </div>
                </div>
                <div class="col-xxl-8  col-lg-8  d-lg-flex order-2 order-lg-1 align-items-center">
                    <nav class="navbar navbar-expand-lg navbar-light ">
                        <div class="container-fluid">
                            <a class="navbar-brand d-block d-lg-none" href="{{ route('home') }}"><img
                                    src="{{ asset('images/logo.png') }}" class="img-fluid" alt=""></a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="main_nav">
                                <ul class="navbar-nav ">
                                    <li class="nav-item"><a class="nav-link"
                                            href="{{ route('home') }}">{{ _i('Main') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="{{ route('aboutus') }}">{{ _i('Goals') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="#">{{ _i('Instructions') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="#">{{ _i('After Quiz') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="#">{{ _i('Contents') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="#}">{{ _i('Befor Quiz') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="#">{{ _i('Help') }}</a></li>
                                    <li class="nav-item"><a class="nav-link"
                                            href="{{ route('contact') }}">{{ _i('Contact Us') }}</a></li>

                                    <!-- For future use -->                                 
                                </ul>
                            </div> <!-- navbar-collapse.// -->
                        </div> <!-- container-fluid.// -->
                    </nav>
                </div>
                <div
                    class="col-lg-2 d-flex    align-items-center order-1 order-lg-2 justify-content-lg-end justify-content-center">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end  main-header-content -->
