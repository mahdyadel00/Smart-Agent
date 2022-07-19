@extends('site.layout.index')

@section('title', _i('Quiz'))

@section('content')

    @include('site.includes.sessions')

    <?php
    $images = \App\Bll\Site::get_default_images();
    $settings = \App\Bll\Site::getSettings();
    $site_settings = \App\Bll\Site::getSettingsData();

    ?>
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">

        <div class="container" data-aos="fade-up">

            <header class="section-header">
                <p>{{ _i('Befor Quiz') }}</p>
            </header>

            <div class="row gy-4">

                <div class="col-lg-6">

                    <h4>{{ $question_details->title }}</h4>
                    <p>{{ $question_details->description }}</p>
                </div>

                <div class="col-lg-6">
                    <form action="{{ route('quiz.store') }}" method="post">
                        @csrf
                        <div class="row gy-4">
                            {{--@dd($questions)--}}
                            @foreach($questions as $question)
                                <div class="question">
                                    <div class="col-md-12">
                                        <input type="text"
                                               value="{{ $question->data->isNotEmpty() ? $question->data->first()->title : '' }}"
                                               class="form-control" disabled>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="true">{{ _i('True') }}</label>
                                        <input type="radio" style="float:right" name="true">
                                        <label for="false" style="float:left">{{ _i('False') }}</label>
                                        <input type="radio" style="float:left" name="false">
                                    </div>
                                </div>
                            @endforeach

                                <div class="col-md-12 text-center">
                                    <button class="btn btn-primary next" type="submit" style="float:left">{{ _i('Next') }}</button>
                                    <button class="btn btn-primary prev" style="float:right">{{ _i('Previous') }}</button>
                                </div>

                        </div>
                    </form>

                </div>

            </div>

        </div>

    </section><!-- End Contact Section -->



@endsection
@push('js')
    <script>
        $(document).ready(function () {
            $('.question').hide()

            $question_shown = $('.question').first().show();

            $('.next').click(function () {
                // e.preventDefault()
                $('.question').hide()
                $question_shown = $question_shown.next().show();

            });

            $('.prev').click(function (e) {
                e.preventDefault()
                $('.question').hide()
                $question_shown = $question_shown.prev().show();

            });

        });
    </script>
@endpush
