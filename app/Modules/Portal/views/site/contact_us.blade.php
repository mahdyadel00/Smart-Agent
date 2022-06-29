@extends('site.layout.index')

@section('content')
    <?php
    $images = \App\Bll\Site::get_default_images();
    $settings = \App\Bll\Site::getSettings();
    $site_settings = \App\Bll\Site::getSettingsData();
    $branches = \App\Bll\Site::getBranches();
    $processes = \App\Bll\Site::getProcesses();
    
    $aboutSection = \App\Bll\Site::getContent()->where('type', 'contact');
    ?>

    <section class="page-head" style="background-image: url('{{ asset('site/images/contact-head-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Contact Us') }}</h3>
        </div>
    </section>

    @include('site.includes.sessions')

    <section class="contact-page-wrapper  py-5">
        <div class="container">
            <div class="branches-information bg-green-primary-faded rounded10 p-5">
                <div class="d-flex justify-content-around gap-3">
                    <div class="single-branch-info bg-transparent shadow-none">
                        <ul class="list-unstyled">
                            <li>
                                <i class="fas fa-envelope"></i>
                                <p>
                                    <strong>{{ _i('E-mail') }}</strong>
                                    {{ $settings->email }}
                                </p>
                            </li>
                        </ul>
                    </div>
                    <div class="single-branch-info bg-transparent shadow-none">
                        <ul class="list-unstyled">
                            <li>
                                <i class="fas fa-envelope-open-text"></i>
                                <p>
                                    <strong>{{ _i('Join our team') }}</strong>
                                    {{ $settings->email2 }}
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row g-4 ">
                    @foreach ($branches as $branch)
                        @if ($branch->TranslatedData != null)
                            {{-- Single branch --}}
                            <div class="col-md-4">
                                <div class="single-branch-info">
                                    <ul class="list-unstyled">
                                        <li>
                                            <i class="fas fa-location"></i>
                                            <p>
                                                <strong>{{ _i('Branch Address') }}</strong>
                                                {{ $branch->TranslatedData->title }} -
                                                {{ $branch->TranslatedData->address }}
                                            </p>
                                        </li>
                                        <li>
                                            <i class="fas fa-phone-alt"></i>
                                            <p>
                                                <strong>{{ _i('Phone Number') }}</strong>
                                                {{ $branch->TranslatedData->phone }}
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
            <!-- End Branches information -->

            @if (!$aboutSection->isEmpty())
                <?php
                    $aboutSection = $aboutSection->first();
                ?>

                <div class="contact-form-wrapper mt-5">
                    <div class="text-center lh-lg my-5">
                        <div class="section-title main-text-color">{{ _i('Aaji\'s dental group') }}</div>
                        <div class="section-title text-green-primary fw-bold ">{{ $aboutSection->TranslatedData->title }}
                        </div>
                        <p class="section-description w-50 mx-auto">{{ $aboutSection->TranslatedData->description }}</p>
                    </div>

                    <form action="{{ route('contact.post') }}" method="post" class="contact-form bg-light-blue p-5 rounded10">
                        @csrf
                        @method('POST')
                        <div class="row g-4">
                            <div class="col-md-6">
                                <input type="text" name="name" class="form-control" id="name" placeholder="{{ _i('Name') }}" required>
                            </div>
                            <div class="col-md-6">
                                <input type="email" name="email" class="form-control" id="email" placeholder="{{ _i('E-mail') }}">
                            </div>
                            <div class="col-md-6">
                                <input type="tel" name="phone" class="form-control" id="phone" placeholder="{{ _i('Phone Number') }}" required>
                            </div>
                            <div class="col-md-6">
                                <select id="branch_id" name="branch_id" class="wide nice-select form-control" class="error" required>
                                    <option value="" selected disabled>{{ _i('Choose the nearest location to you') }}</option>
                                    @foreach ($branches as $branch)
                                        @if ($branch->TranslatedData != null)
                                            <option value="{{ $branch->id }}">{{ $branch->TranslatedData->title }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-12">
                                <select id="processing_id" name="processing_id" class="wide nice-select form-control" class="error" required>
                                    <option value="" selected disabled>{{ _i('Chooses the appropriate medical examination') }}</option>
                                    @foreach ($processes as $process)
                                        @if ($process->data != null)
                                            <option name="processing_id" value="{{ $process->id }}">{{ $process->data->title }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-12">
                                <textarea cols="30" rows="4" class="form-control" name="message" placeholder="{{ _i('Notes') }}"></textarea>
                            </div>
                            <div class="col-md-12">
                                <div class="text-end">
                                    <input type="submit" value="{{ _i('Send') }}" class="btn btn-green-primary px-5">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            @endif
        </div>
    </section>
@endsection
