@extends('site.layout.index')

@section('title', _i('Blog Categories'))

@section('content')

    <?php
    $images = \App\Bll\Site::get_default_images();
    $site_settings = \App\Bll\Site::getSettingsData();
    ?>

    <section class="page-head" style="background-image: url('{{ asset('site/images/blog-head-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">{{ _i('Blog Categories') }}</h3>
        </div>
    </section>

    <section class="media-page-wrapper bg-light-blue py-5">
        <div class="container">
            <div class="row g-4">
                @forelse($cats as $cat)
                    @if ($cat->data != null)
                        <div class="col-md-4">
                            <div class="single-blog-wrapper">
                                <a href="{{ route('blog_cat', $cat->id) }}">
                                    <div class="thumbnail">
                                        <img src="{{ asset($cat->photo) }}" class="img-fluid" loading="lazy" alt="">
                                    </div>
                                </a>
                                <div class="pt-0 p-4">
                                    <h2 class="post-title"><a href="{{ route('blog_cat', $cat->id) }}">{{ $cat->data->name }}</a></h2>
                                </div>
                            </div>
                        </div>
                    @endif
                @empty
                    <div class="title main-text-color text-center fw-bold fz21">{{ 'لا يوجد أقسام للمقالات حتى الآن' }}
                    </div>
                @endforelse
            </div>
        </div>
    </section>
@endsection
