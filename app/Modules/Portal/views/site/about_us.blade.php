@extends('site.layout.index')

@section('content')
<section id="about" class="about">

    <div class="container" data-aos="fade-up">
      <div class="row gx-0">

        <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
          <div class="content">
            <h3>{{ $main_goals ? $main_goals->Data->title : '' }}</h3>
            <p>{{ $main_goals ? $main_goals->Data->description : '' }} </p>
            <div class="text-center text-lg-start">
              <a href="#" class="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                {{--  <span>Read More</span>  --}}
                <i class="bi bi-arrow-right"></i>
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
          <img src="{{ asset($main_goals ? $main_goals->image : '') }}" class="img-fluid" alt="">
        </div>

      </div>
    </div>

  </section><!-- End About Section -->
@endsection
