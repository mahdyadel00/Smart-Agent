@extends('site.layout.index')

@section('content')

    <section class="page-head" style="background-image: url('{{ asset('site/images/contact-head-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Login') }}</h3>
        </div>
    </section>

    @include('site.includes.sessions')
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">

        <div class="container" data-aos="fade-up">

            <header class="section-header">
                <p>{{ _i('login') }}</p>
            </header>

            <div class="row gy-4">

                <div class="col-lg-6">

                    <div class="row gy-4">
                        <div class="col-md-12">
                            <div class="info-box">
                                <img src="{{ $login ? $login->image : '' }}" alt="{{ _i('Login') }}">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="info-box">
                                <h3>{{ $login? $login->Data->title : '' }}</h3>
                                <p>{{ $login ? $login->Data->description : '' }}</p>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="col-lg-6">
                    <form action="{{ route('login.check') }}" method="post">
                        @csrf
                        <div class="row gy-4">

                            <div class="col-md-10">
                                <label for="email">{{ _i('Email') }}</label>
                                <input type="email" class="form-control" name="email" placeholder="{{ _i('Email') }}">
                            </div>

                            <div class="col-md-10">
                                <label for="password">{{ _i('Password') }}</label>
                                <input type="password" class="form-control" name="password" placeholder="{{ _i('Password') }}">
                            </div>

                            <div class="col-md-10">
                                <label for="password_confirmation">{{ _i('Confirm Password') }}</label>
                                <input type="password" class="form-control" name="password_confirmation" placeholder="{{ _i(' Confirm Password') }}">
                            </div>


                            <div class="col-md-12 text-center">
                                <button class="btn btn-primary" type="submit">{{ _i('Login') }}</button>
                                {{--  <button type="submite">{{ _i('Login') }}</button>  --}}
                            </div>

                        </div>
                    </form>

                </div>

            </div>

        </div>

    </section><!-- End Contact Section -->
@endsection
