<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Select 2 css -->
    <link rel="stylesheet" href="{{asset('AdminFlatAble/bower_components/select2/css/select2.min.css')}}" />
    <link href="{{ asset('custom/parsley.css') }}" rel="stylesheet">

    @if(\App\Bll\Lang::getLangCode() == "ar")
    <link href="{{asset('site/css/bootstrap.rtl.min.css')}}" rel="stylesheet"><!-- Change to bootstrap.rtl in Arabic version -->
    @else
    <link href="{{asset('site/css/bootstrap.min.css')}}" rel="stylesheet">
    @endif
    <link href="{{asset('site/css/all.min.css')}}" rel="stylesheet"> <!-- FontAwesome -->
    <link href="{{asset('site/css/slick.css')}}" rel="stylesheet">
    <link href="{{asset('site/css/nice-select.css')}}" rel="stylesheet">
    @if(\App\Bll\Lang::getLangCode() == "ar")
    <link href="{{asset('site/css/style.css')}}" rel="stylesheet"><!-- Change to rtl.css in Arabic version -->
    @else
    <link href="{{asset('site/css/en.css')}}" rel="stylesheet">
    @endif
    <link href="{{asset('site/css/backend.css')}}" rel="stylesheet">

    <title>@yield('title')
        @hasSection('title')
         -
        @endif
        {{ $settings['title'] }}
    </title>

    @stack('css')
</head>
