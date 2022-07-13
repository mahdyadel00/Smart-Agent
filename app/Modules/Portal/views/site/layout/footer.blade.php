
<footer id="footer" class="footer">


    <div class="footer-top">
      <div class="container">
        <div class="row gy-4">
          <div class="col-lg-5 col-md-12 footer-info">
            <a href="index.html" class="logo d-flex align-items-center">
              <img src="{{ asset('site') }}/img/logo.png" alt="">
              <span>{{ $site_settings->title }}</span>
            </a>
            <p{{ $site_settings->description }}</p>
            <div class="social-links mt-3">
              <a href="{{ $site_settings->twitter_url }}" class="twitter"><i class="bi bi-twitter"></i></a>
              <a href="{{ $site_settings->facebook_url }}" class="facebook"><i class="bi bi-facebook"></i></a>
              <a href="{{ $site_settings->instagram_url }}" class="instagram"><i class="bi bi-instagram"></i></a>
              <a href="{{ $site_settings->mail_url }}" class="email"><i class="bi bi-envelope"></i></a>
            </div>
          </div>

          <div class="col-lg-2 col-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="{{ route('home') }}">{{ _i('Home') }}</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#about">{{ _i('Main Goals') }}</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#services">{{ _i('Main Insturcation') }}</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="#portfolio">{{ _i('Help') }}</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="{{ route('contact') }}">{{ _i('Contact Us') }}</a></li>
            </ul>
          </div>



          <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
            <h4>{{ _I('Contact Us') }}</h4>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong>{{ $site_settings->phone1 }}<br>
              <strong>Email:</strong>{{ $site_settings->email }}<br>
            </p>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>{{ _i('Smart Agent') }}</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/flexstart-bootstrap-startup-template/ -->
        Maded By <a href="https://bootstrapmade.com/">Mahdy Adel</a>
      </div>
    </div>
  </footer><!-- End Footer -->
</body>

</html>

  {{--  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>  --}}
