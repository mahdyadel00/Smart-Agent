@extends('site.layout.index')

@section('content')
    <?php
    $images = \App\Bll\Site::get_default_images();
    $settings = \App\Bll\Site::getSettings();
    $site_settings = \App\Bll\Site::getSettingsData();

    ?>

    <section class="page-head" style="background-image: url('{{ asset('site/images/contact-head-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Contact Us') }}</h3>
        </div>
    </section>

    @include('site.includes.sessions')
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">

        <div class="container" data-aos="fade-up">

            <header class="section-header">
                {{-- <h2>{{ _i('Contact Us') }}</h2> --}}
                <p>{{ _i('Contact Us') }}</p>
            </header>

            <div class="row gy-4">

                <div class="col-lg-6">

                    <div class="row gy-4">
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bi bi-geo-alt"></i>
                                <h3>Address</h3>
                                <p>{{ $site_settings->address }}<br>New York, NY 535022</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bi bi-telephone"></i>
                                <h3>Call Us</h3>
                                <p>{{ $site_settings->phone1 }}<br>{{ $site_settings->phone2 }}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bi bi-envelope"></i>
                                <h3>Email Us</h3>
                                <p>{{ $site_settings->email }} <br>{{ $site_settings->email2 }}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-box">
                                <i class="bi bi-clock"></i>
                                <h3>{{ _i('Working Hours') }}</h3>
                                <p>{{ $site_settings->working_hours }}</p>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-6">
                    <form action="{{ route('contact.post') }}" method="post">
                        @csrf
                        <div class="row gy-4">

                            <div class="col-md-6">
                                <input type="text" name="name" class="form-control" placeholder="{{ _i('Name') }}">
                            </div>

                            <div class="col-md-6 ">
                                <input type="email" class="form-control" name="email" placeholder="{{ _i('Email') }}">
                            </div>

                            <div class="col-md-12">
                                <input type="text" class="form-control" name="phone" placeholder="{{ _i('Phone') }}">
                            </div>
                            <div class="col-md-12">
                                <input type="text" class="form-control" name="subject"
                                    placeholder="{{ _i('Subject') }}">
                            </div>

                            <div class="col-md-12">
                                <textarea class="form-control" name="message" rows="6" placeholder="{{ _i('Subject') }}"></textarea>
                            </div>

                            <div class="col-md-12 text-center">
                                <button class="btn btn-primary" type="submit">{{ _i('Send Message') }}</button>
                            </div>

                        </div>
                    </form>

                </div>

            </div>

        </div>

    </section><!-- End Contact Section -->
@endsection
