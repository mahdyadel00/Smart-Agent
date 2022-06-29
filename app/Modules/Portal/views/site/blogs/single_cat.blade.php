@extends('site.layout.index')

@section('title', $category->data->name ?? "")

@section('content')
    @php
        $settings = \App\Bll\Site::getSettings();
    @endphp

    <section class="media-page-wrapper bg-light-blue py-5">
        <div class="container">
            <div class="text-center lh-lg mb-5">
                <div class="section-title">{{ $category->data->name ?? "" }}</div>
                <div class="title main-text-color fw-bold fz21">{!! $category->data->description ?? "" !!}</div>
            </div>
            @if ($blogs->count() > 0)
            <div class="row g-4">
                @foreach($blogs as $blog_item)
                    <div class="col-md-4">
                        <div class="single-blog-wrapper">
                            <a href="{{ route('blog', $blog_item->blog_id) }}">
                                <div class="thumbnail">
                                    <img src="{{ asset($blog_item->image) }}" class="img-fluid" loading="lazy" alt="">
                                </div>
                            </a>
                            <div class="pt-0 p-4">
                                <h2 class="post-title"><a href="{{ route('blog', $blog_item->blog_id) }}">{{ $blog_item->title }}</a></h2>
                                <div class="post-date">{{ date('d M Y', $blog_item->created_at->timestamp) }}</div>
                                <p class="section-description">{!! strip_tags( str_limit($blog_item->content, 200)) !!}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            @else
            <div class="title main-text-color text-center fw-bold fz21">{{ 'لا يوجد مقالات في هذا القسم' }}
            </div>
            @endif
        </div>
    </section>
@endsection

    {{-- <section class="category-page  py-5"> --}}
        {{-- <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="search-form">
                        <form action="{{route('search')}}" method="get"  data-parsley-validate="">
                            @csrf
                            <input type="text" class="form-control" name="search_key" required="" placeholder="{{_i('Search')}}..">
                            <button type="submit" class="btn btn-orange"><i class="fa fa-search"></i></button>
                        </form>
                    </div> --}}
{{--                    @if($category->attachment)--}}
{{--                    <div class="download-catalog mt-3">--}}
{{--                        <a href="{{asset($category->attachment->file)}}" class="d-flex justify-content-between align-items-center" download="">--}}
{{--                            <p>--}}
{{--                                <img src="{{$category->attachment->file}}" alt="" class="img-fluid" loading="lazy">--}}
{{--                                {{_i('Download File')}}--}}
{{--                            </p>--}}
{{--                            <i class="fas fa-download"></i>--}}
{{--                        </a>--}}
{{--                    </div>--}}
{{--                    @endif--}}

                    {{-- <div class="cats-list bg-light-blue   p-2 mt-3">
                        <div class="title bg-blue text-white fw-bold rounded p-3 fz21">{{_i('Categories')}}</div>
                        <ul class="list-unstyled p-2 pb-0 mb-0">
                            @foreach($blog_categories as $cat_item)
                                <li><a href="{{route('blog_cat', $cat_item->blog_id)}}">{{$cat_item->name}}</a></li>
                            @endforeach
                        </ul>
                    </div>

                    <div class="support-box mt-3">
                        <div class="fw-bold fz30">{{_i('Can us help you')}}?</div>
                        <div class="fz21">{{_i('Technical Support Number')}}</div>
                        @php
                            $settings = \App\Bll\Site::getSettings();
                        @endphp
                        @if($settings != null)
                            <a href="tel:{{$settings->phone1}}">{{$settings->phone1}}</a>
                            <a href="tel:{{$settings->phone2}}">{{$settings->phone2 }}</a>
                        @endif

                    </div>

                    @include('site.layout.sale_point')

                </div>

            </div>

        </div>
    </section> --}}
