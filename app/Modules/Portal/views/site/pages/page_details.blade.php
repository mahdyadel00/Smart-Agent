@extends('site.layout.index')

@section('title', $page->title ?? null)

@section('content')

    <section class="about-us-page py-5 ">
        <div class="container">
            @if ($page != null)
            <div class="hero-img">
                <img src="{{asset($page->image)}}" alt="" class="img-fluid">
            </div>
            <br>
            <div class="section-title fancy-orange">{{ $page->title ?? null }}</div>
            <p class="description mt-4">{!! $page->content !!}</p>
            @endif

        </div>
    </section>


@endsection
