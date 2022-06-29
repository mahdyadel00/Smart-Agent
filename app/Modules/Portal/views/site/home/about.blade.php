<section class="about-us">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                <div class="about-img mb-3">
                    <img src="{{ $aboutSection->image }}" alt="" class="img-fluid" loading="lazy">
                </div>
                <div class="small-title text-green-secondary fz21 fw-bold mt-2">{{ _i('Who Are We') }}</div>
                <div class="section-title text-green-primary mt-2">{{ $aboutSection->TranslatedData->title }}</div>
                <p class="section-description mt-3">{{ $aboutSection->TranslatedData->description }}
                </p>
            </div>
            <div class="col-lg-4 col-md-5">
                <div class="working-hrs">
                    <div class="text-center">
                        <div class="title d-inline-block btn-green-primary">{{ _i('Working Hours') }}</div>
                    </div>
                    <div class="bg-green-primary-faded rounded10 p-4 overflow-hidden">
                        <ul class="list-unstyled">
                            @foreach ($days as $day)
                                <li class="d-flex justify-content-between gap-3">
                                    <span>{{ $day->TranslatedData->title }}</span>
                                    <span>{{ \Carbon\Carbon::parse($day->time->start_time)->translatedFormat('g:i A') }} - {{ \Carbon\Carbon::parse($day->time->end_time)->translatedFormat('g:i A') }}</span>
                                </li>
                            @endforeach
                            <li class="bg-green-primary  text-white d-flex justify-content-between gap-3"><span>{{ _i('Emergency Doctor') }}</span><span>{{ _i('24 Hours / Day') }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>