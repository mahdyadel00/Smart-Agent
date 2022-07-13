@extends('site.layout.index')

@section('title', $blog->title ?? null)

@section('content')
    @php
        $settings = \App\Bll\Site::getSettings();
    @endphp

    <section class="page-head" style="background-image: url('{{ asset('site/images/blog-head-img.jpg') }}');">
        <div class="container">
            <h3 class="page-title">@if($blog_cat != null) {{ $blog_cat->name }} - @endif {{$blog->title ?? null}}</h3>
        </div>
    </section>

    <div class="inner-page-wrapper bg-light-blue py-5">
        <section class="blog-page ">
            <div class="container">
                <div class="single-blog-post-page">
                    <div class="row">
                        <div class="col-md-8">
    
                            <div class="blog-post single-blog-post ">
                                <div class="thumbnail"><img src="{{ asset($blog->image) }}" class="img-fluid"
                                                            loading="lazy" alt=""></div>
                                <div class="post-date">{{ \Carbon\Carbon::parse($blog->created_at->timestamp)->translatedFormat('M d, Y') }}</div>
                                <h3 class="post-title">{{ $blog->title ?? null }}</h3>
                                <div class="post-content ">{!! $blog->content !!}</div>
                            </div>
                        </div>
                        {{-- @dd($similar_blogs) --}}
                        @if ($similar_blogs->count() > 0)
                        <div class="col-md-4">

                            {{-- Related blogs based on category --}}
                            @foreach($similar_blogs as $blog_item)
                            <div class="single-blog-post h-style">
                                <a href="{{ route('blog', $blog_item->blog_id) }}" class="thumbnail"><img src="{{ asset($blog_item->image) }}" class="img-fluid"
                                        loading="lazy" alt=""></a>
                                <div class="post-meta">
                                    <h3 class="post-title"><a href="{{ route('blog', $blog_item->blog_id) }}">{{ $blog_item->title }}</a></h3>
                                    <a href="{{ route('blog', $blog_item->blog_id) }}" class="read-more">{{ _i('Read more') }}</a>
                                </div>
                            </div>
                            @endforeach

                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
