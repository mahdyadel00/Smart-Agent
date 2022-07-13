{{-- <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Select 2 css -->
    <link rel="stylesheet" href="{{asset('AdminFlatAble/bower_components/select2/css/select2.min.css')}}" />
    <link href="{{ asset('custom/parsley.css') }}" rel="stylesheet">

    @if (\App\Bll\Lang::getLangCode() == 'ar')
    <link href="{{asset('site/css/bootstrap.rtl.min.css')}}" rel="stylesheet"><!-- Change to bootstrap.rtl in Arabic version -->
    @else
    <link href="{{asset('site/css/bootstrap.min.css')}}" rel="stylesheet">
    @endif
    <link href="{{asset('site/css/all.min.css')}}" rel="stylesheet"> <!-- FontAwesome -->
    <link href="{{asset('site/css/slick.css')}}" rel="stylesheet">
    <link href="{{asset('site/css/nice-select.css')}}" rel="stylesheet">
    @if (\App\Bll\Lang::getLangCode() == 'ar')
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
</head> --}}

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title')
        @hasSection('title')

        @endif
        {{ $settings['title'] }}
    </title>
    <meta content="" name="description">

    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="{{ asset('site') }}/img/favicon.png" rel="icon">
    <link href="{{ asset('site') }}//img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="{{ asset('site') }}//vendor/aos/aos.css" rel="stylesheet">
    <link href="{{ asset('site') }}//vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{ asset('site') }}//vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="{{ asset('site') }}//vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="{{ asset('site') }}//vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="{{ asset('site') }}//vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="{{ asset('site') }}//css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: FlexStart - v1.9.0
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    @stack('css')
</head>
