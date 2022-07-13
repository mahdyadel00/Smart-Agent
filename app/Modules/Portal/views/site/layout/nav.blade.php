
<header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <img src="{{ asset('site') }}/img/logo.png" alt="">
        <span>{{ _i('Smart Agent') }}</span>
      </a>

      <nav id="navbar" class="navbar text-center">
        <ul>
          <li><a class="nav-link scrollto active" href="{{ route('home') }}">{{ _i('Home') }}</a></li>
          <li><a class="nav-link scrollto" href="#about">{{ _i('Main Goals') }}</a></li>
          <li><a class="nav-link scrollto" href="#services">{{ _i('Main Insturcation') }}</a></li>
          <li><a class="nav-link scrollto" href="{{ route('quiz') }}">{{ _i('Befor Quiz') }}</a></li>
          <li><a class="nav-link scrollto" href="#portfolio">{{ _i('Help') }}</a></li>
          {{--  <li><a class="nav-link scrollto" href="#team">Team</a></li>  --}}
          {{--  <li><a href="blog.html">Blog</a></li>  --}}
          {{--  <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>  --}}
          <li><a class="nav-link scrollto" href="{{ route('contact') }}">{{ _i('contacts') }}</a></li>
          <li><a class="getstarted scrollto" href="{{ route('login') }}">{{ _i('get_started') }}</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header>

