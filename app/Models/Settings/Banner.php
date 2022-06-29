<?php


namespace App\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $table = 'banners';
    public $timestamps = true;
    protected $guarded = [];

	public function Data(){
        return $this->hasOne('App\Models\Settings\BannerData','banner_id','id')->where('lang_id',\App\Bll\Lang::getSelectedLangId());
    }

	public function getImageAttribute($value)
	{
		if(\request()->is('api/*')){
			return url( $value);
		}
		return $value;
	}
}