<nav class="pcoded-navbar" pcoded-header-position="relative">
    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
    <div class="pcoded-inner-navbar main-menu">
        <div class="">
            <div class="main-menu-header" hidden>
                <a href="{{ url('/') }}"
                    style="background-image: url(@if (\App\Bll\Utility::get_main_settings() != null) {{ asset('uploads/settings/site_settings/' . \App\Bll\Utility::get_main_settings()->logo) }} @endif; background-repeat: no-repeat;background-position: 50% 50%;background-size: cover;display:block;width:100%;height:100%">
                </a>
            </div>
            <div class="main-menu-content">
                <ul>
                    <li class="more-details">
                        <a href="{{ url('admin/profile') }}"><i
                                class="ti-user"></i>{{ _i('View Profile') }}</a>
                        <a href="{{ url('admin/settings') }}"><i class="ti-settings"></i>{{ _i('Settings') }}</a>
                        <a href="{{ route('admin.logout') }}"><i
                                class="ti-layout-sidebar-left"></i>{{ _i('Logout') }}
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation" menu-title-theme="theme5">
            {{ _i('MAIN NAVIGATION') }}</div>
        <ul class="pcoded-item pcoded-left-item">

            @if (auth('admin')->user()->can('Dashboard'))
                <li class="{{ request()->url() == route('admin.home') ? 'active' : '' }}">
                    <a href="{{ route('admin.home') }}">
                        <span class="pcoded-micon"><i class="ti-home"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.default">{{ _i('Dashboard') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
            @endif

            @can('Security')
                <li class="pcoded-hasmenu">
                    <a href="javascript:void(0)"><i class="fa fa-circle-o"></i>
                        <span class="pcoded-micon"><i class="ti-ticket"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.default">{{ _i('Security') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                    <ul class="pcoded-submenu">
                        @can('permissions')
                            <li hidden class="{{ request()->is('admin/permission*') ? 'active' : '' }}">
                                <a href="{{ url('admin/permission') }}">
                                    <span class="pcoded-micon"><i class="ti-settings"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.default">{{ _i('Permissions') }}</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        @endcan
                        @can('Role')
                            <li class="{{ request()->is('admin/role*') ? 'active' : '' }}">
                                <a href="{{ url('/admin/role') }}">
                                    <span class="pcoded-micon"><i class="ti-check-box"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.default">{{ _i('Roles') }}</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        @endcan
                        @can('admin')
                            <li class="{{ request()->is('admin/admin*') ? 'active' : '' }}">
                                <a href="{{ url('/admin/admin') }}">
                                    <span class="pcoded-micon"><i class="ti-check-box"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.default">{{ _i('Admins') }}</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcan

            {{-- Contacts --}}
            @can('Contact us')
                <li class=" {{ request()->is('admin/contacts/*') || request()->is('admin/contacts') ? 'active' : '' }}">
                    <a href="{{ url('/admin/contacts') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Contacts') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
            @endcan



                <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation" menu-title-theme="theme5">{{ _i('General') }}</div>

                @can('Login')
                <li
                    class=" {{ request()->is('admin/login/*') || request()->is('admin/login') ? 'active' : '' }}">
                    <a href="{{ url('/admin/login') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Login') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('mainPage')
                <li
                    class=" {{ request()->is('admin/main_page/*') || request()->is('admin/main_page') ? 'active' : '' }}">
                    <a href="{{ url('/admin/main_page') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Main') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('mainGoal')
                <li
                    class=" {{ request()->is('admin/main_goals/*') || request()->is('admin/main_goals') ? 'active' : '' }}">
                    <a href="{{ url('/admin/main_goals') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Main Goals') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('MainInsturcation')
                <li
                    class=" {{ request()->is('admin/main_insturcation/*') || request()->is('admin/main_insturcation') ? 'active' : '' }}">
                    <a href="{{ url('/admin/main_insturcation') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Main Insturcation') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('Help')
                <li
                    class=" {{ request()->is('admin/help/*') || request()->is('admin/help') ? 'active' : '' }}">
                    <a href="{{ url('/admin/help') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Help') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan

                @can('Questions')
                <li class=" {{ request()->is('admin/questions/*') || request()->is('admin/questions') ? 'active' : '' }}">
                    <a href="{{ url('/admin/questions') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Questions') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation" menu-title-theme="theme5">{{ _i('Modules') }}</div>
                @can('Modules')
                <li
                    class=" {{ request()->is('admin/modules/*') || request()->is('admin/modules') ? 'active' : '' }}">
                    <a href="{{ url('/admin/modules') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Modules') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('Goals')
                <li
                    class=" {{ request()->is('admin/goals_modules/*') || request()->is('admin/goals_modules') ? 'active' : '' }}">
                    <a href="{{ url('/admin/goals_modules') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Goal Modules') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('Insturctions')
                <li
                    class=" {{ request()->is('admin/insturctions/*') || request()->is('admin/insturctions') ? 'active' : '' }}">
                    <a href="{{ url('/admin/insturctions') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Insturctions') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('ActivityModules')
                <li
                    class=" {{ request()->is('admin/activity_modules/*') || request()->is('admin/activity_modules') ? 'active' : '' }}">
                    <a href="{{ url('/admin/activity_modules') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('ActivityModules') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('QuizModule')
                <li
                    class=" {{ request()->is('admin/quiz_module/*') || request()->is('admin/quiz_module') ? 'active' : '' }}">
                    <a href="{{ url('/admin/quiz_module') }}">
                        <span class="pcoded-micon"><i class="ti-menu-alt"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('QuizModule') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation" menu-title-theme="theme5">
                {{ _i('Settings') }}</div>
            <ul class="pcoded-item pcoded-left-item">
                @can('Settings')
                <li
                    class=" {{ request()->is('admin/settings/*') || request()->is('admin/settings') || request()->is('admin/content_management') ? 'active' : '' }}">
                    <a href="{{ url('/admin/settings') }}">
                        <span class="pcoded-micon"><i class="ti-settings"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Settings') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
                @can('Pages')
                <li class=" {{ request()->is('admin/pages/*') || request()->is('admin/pages') ? 'active' : '' }}">
                    <a href="{{ url('/admin/pages') }}">
                        <span class="pcoded-micon"><i class="ti-settings"></i></span>
                        <span class="pcoded-mtext" data-i18n="nav.dash.main">{{ _i('Pages') }}</span>
                        <span class="pcoded-mcaret"></span>
                    </a>
                </li>
                @endcan
            </ul>
        </ul>

    </div>
</nav>
