<?php

namespace App\Bll;

use App\Setting;
use App\DefaultImage;
use App\Models\Settings\Slider;

class Site
{

    // public static function getPagesFooter()
    // {
    //     $pages = SitePage::with('data')
    //         ->where('published', 1)
	// 		->where('place', 'footer')
    //         ->orderBy('page_order')
	// 		->get();
 	// 	return $pages;
    // }

    public static function getPagesHeader()
    {
        $pages = SitePage::leftJoin('site_pages_data','site_pages_data.page_id','site_pages.id')
            ->select('site_pages.id','site_pages_data.title')
            ->where('published', 1)
            ->where('place', 'header')
            ->where('lang_id', Lang::getSelectedLangId())
            ->orderBy('page_order')
            ->get();
        return $pages;
    }

    



    public static function getSettings()
    {
        if (session("settings") != null)
            return session("settings");
        $settings = Setting::join('settings_data', 'settings.id', 'settings_data.setting_id')
            ->select(
                'settings_data.id',
                'settings_data.title',
                'settings.id as setting_id',
                'settings_data.lang_id',
                'settings.email',
                'settings.email2',
                'settings.logo',
                'settings.facebook_url',
                'settings.twitter_url',
                'settings.youtube_url',
                'settings.instagram_url',
                'settings.order_accept',
                'settings.product_rating',
                'settings.product_outStock',
                'settings.discount_codes',
                'settings.similar_products',
                'settings.chat_mode',
                'settings.chat_code',
                'settings.phone1',
                'settings.phone2',
                'settings.customer_count',
                'settings.projects_count',
                'settings.work_time',
                'settings.branches_no',
                'settings.doctors_no',
                'settings.years_exp_no'
            )
            ->where('settings_data.lang_id', Lang::getSelectedLangId())
            ->first();
        session()->put("settings", $settings);
        return $settings;
    }

    public static function getSettingsData() {
        $settings = Setting::leftJoin('settings_data', 'settings.id', '=', 'settings_data.setting_id')
            ->select('settings.*', 'settings_data.title as title', 'settings_data.description as description', 'settings_data.lang_id as lang_id', 'settings_data.working_hours as working_hours')
            ->where('settings_data.lang_id', \App\Bll\Lang::getSelectedLangId())
            ->first();
        return $settings;
    }


    public static function getSlider()
	{
		$sliders = Slider::with([
            'Data' => function ($query) {
                $query->where('lang_id', '=', \App\Bll\Lang::getSelectedLang()->id);
            },
        ])->where('published', '=', 1)->get();
		return $sliders;
	}

    public static function get_default_images()
    {
        $images = DefaultImage::first();

        $images->favicon = asset('/uploads/default_images/' .  $images->favicon);
        $images->header = asset('/uploads/default_images/' .  $images->header);
        $images->footer = asset('/uploads/default_images/' .  $images->footer);
        $images->not_found = asset('/uploads/default_images/' .  $images->not_found);

        return $images;
    }
}
