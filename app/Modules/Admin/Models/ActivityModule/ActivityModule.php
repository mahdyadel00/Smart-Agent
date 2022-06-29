<?php

namespace App\Modules\Admin\Models\ActivityModule;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\ActivityModule\ActivityModuleData;

class ActivityModule extends Model
{
    protected $table = 'activity_modules';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(ActivityModuleData::class,'activity_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(ActivityModuleData::class,'activity_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
