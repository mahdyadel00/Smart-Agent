<?php

namespace App\Modules\Admin\Models\Main;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Main\MainData;

class Main extends Model
{
    protected $table = 'mains';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(MainData::class,'main_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(MainData::class,'main_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
