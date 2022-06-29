<?php


namespace App\Models\Settings;

use App\Models\Settings\SliderData;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    protected $table = 'sliders';
    public $timestamps = true;
    protected $guarded = [];

	public function getImageAttribute($value)
	{
		if(\request()->is('api/*')){
			return url( $value);
		}
		return $value;
	}

	public function Data () {
		return $this->hasMany(SliderData::class, 'slider_id', 'id');
	}
}