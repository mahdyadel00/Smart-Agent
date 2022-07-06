<?php

namespace App\Modules\Admin\Models\Main;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Main\InsturcationData;

class Insturcation extends Model
{
    protected $table = 'main_insturcation';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(InsturcationData::class,'main_insturcation_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(InsturcationData::class,'main_insturcation_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
