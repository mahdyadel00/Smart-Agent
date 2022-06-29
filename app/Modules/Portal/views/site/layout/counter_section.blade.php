@php
    $settings = \App\Bll\Site::getSettings();
@endphp

<div class="container">
    <div class="counters-wrapper">
        <div class="row">
            <div class="col-md-4">
                <div class="single-counter">
                    <div class="icon"><img src="{{asset('site/images/groups_black_24dp.webp')}}" alt="" class="img-fluid"
                                           loading="lazy"></div>
                    <div class="context">
                        <div class="counter">{{$settings['customer_count']}}</div>
                        <p>{{_i('Happy Custmors')}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-counter">
                    <div class="icon"><img src="{{asset('site/images/apartment_black_24dp.webp')}}" alt="" class="img-fluid"
                                           loading="lazy"></div>
                    <div class="context">
                        <div class="counter">{{$settings['projects_count']}}</div>
                        <p>{{_i('Finished Projects')}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-counter">
                    <div class="icon"><img src="{{asset('site/images/inventory_2_black_24dp.webp')}}" alt="" class="img-fluid"
                                           loading="lazy"></div>
                    <div class="context">
                        <div class="counter">{{\App\Modules\Admin\Models\Products\products::count()}}</div>
                        <p>{{_i('Products')}}</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
