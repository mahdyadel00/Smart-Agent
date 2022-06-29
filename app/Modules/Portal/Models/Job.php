<?php

namespace App\Modules\Portal\Models;

use App\Bll\Lang;
use App\Modules\Admin\Models\Settings\City;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
	protected $table   = 'jobs';
	protected $guarded = [];


	public function data()
	{
		return $this->hasOne(JobData::class ,'job_id','id');
	}

    public function TranslatedData()
    {
        return $this->hasOne(JobData::class ,'job_id','id')->where('lang_id',Lang::getSelectedLangId());
    }

    public function jobCity()
    {
        return $this->hasOne(City::class ,'city_id','id');
    }

    public function data_back()
    {
        return $this->hasMany(JobData::class ,'job_id','id');
    }
    public function attachment()
    {
        return $this->hasMany(JobAttachment::class ,'job_id','id');
    }
}
