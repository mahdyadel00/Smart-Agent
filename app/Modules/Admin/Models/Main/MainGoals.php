<?php

namespace App\Modules\Admin\Models\Main;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Main\MainGoalsData;

class MainGoals extends Model
{
    protected $table = 'main_goals';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(MainGoalsData::class,'main_goal_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(MainGoalsData::class,'main_goal_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
