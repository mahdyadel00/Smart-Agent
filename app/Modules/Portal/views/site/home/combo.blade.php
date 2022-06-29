{{-- @dd($comboSection) --}}
<section class="counters bg-light-blue">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="counters-gallery">
                    <div class="row g-2">
                        <div class="col-md-6">
                            <img src="{{ $comboSection->banners[0]->image }}" alt="" class="img-fluid"
                                loading="lazy">
                        </div>
                        <div class="col-md-6">
                            <img src="{{ $comboSection->banners[1]->image }}" alt="" class="img-fluid"
                                loading="lazy">
                        </div>
                        <div class="col-md-6">
                            <img src="{{ $comboSection->banners[2]->image }}" alt="" class="img-fluid"
                                loading="lazy">
                        </div>
                        <div class="col-md-6">
                            <img src="{{ $comboSection->banners[3]->image }}" alt="" class="img-fluid"
                                loading="lazy">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="big-title section-title">{{ $comboSection->TranslatedData->title }}</div>
                <p class="section-description my-3">{{ $comboSection->TranslatedData->description }}
                </p>
                <div class="the-counters">
                    <div class="single-counter d-flex justify-content-between align-items-center gap-3">
                        <div class="title">
                            <div class="icon"><img src="{{ asset('site/images/dental.svg') }}" alt=""
                                    class="img-fluid" loading="lazy"></div>
                            {{ _i('Branches at your service') }}
                        </div>
                        <div class="counter">
                            {{ $settings->branches_no }}
                        </div>
                    </div>
                    <div class="single-counter d-flex justify-content-between align-items-center gap-3">
                        <div class="title">
                            <div class="icon"><img src="{{ asset('site/images/dental-care.svg') }}" alt=""
                                    class="img-fluid" loading="lazy"></div>
                            {{ _i('Specialist doctor at your service') }}
                        </div>
                        <div class="counter">
                            {{ $settings->doctors_no }}
                        </div>
                    </div>
                    <div class="single-counter d-flex justify-content-between align-items-center gap-3">
                        <div class="title">
                            <div class="icon"><img src="{{ asset('site/images/tooth.svg') }}" alt=""
                                    class="img-fluid" loading="lazy"></div>
                            {{ _i('Years of Experience') }}
                        </div>
                        <div class="counter">
                            {{ $settings->years_exp_no }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
