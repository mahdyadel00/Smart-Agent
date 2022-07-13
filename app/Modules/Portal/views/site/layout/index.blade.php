<!DOCTYPE html>
{{--  @if(\App\Bll\Lang::getLangCode()== "ar")  --}}
    <html lang="ar" dir="rtl"><!-- Change to RTL in Arabic version -->
{{--  @else  --}}
    {{--  <html lang="en" dir="ltr">  --}}
{{--  @endif  --}}

@php
    $settings = \App\Bll\Site::getSettings();
    $site_settings = \App\Bll\Site::getSettingsData();
@endphp

@include('site.includes.style',['settings' => $settings])

<body>

@include('site.layout.nav')

<section>

    @yield('content')
</section>

@include('site.layout.footer' ,['settings' => $settings ])

@include('site.includes.script')

</body>

</html>
