<?php

namespace App\Modules\Admin\Models\QuizModule;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\QuizModule\QuizModuleData;

class QuizModule extends Model
{
    protected $table = 'quiz_after_modules';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(QuizModuleData::class,'quiz_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(QuizModuleData::class,'quiz_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
