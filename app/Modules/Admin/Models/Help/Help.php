<?php

namespace App\Modules\Admin\Models\Help;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Help\HelpData;

class Help extends Model
{
    protected $table = 'helps';
    protected $guarded = [];

    public function data(){
        return $this->hasMany(HelpData::class);
    }

    public function TranslatedData(){
        return $this->hasOne(HelpData::class,'help_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }


}
