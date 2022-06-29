<?php

namespace App\Modules\Admin\Models\Modules;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Modules\GoalsModulesData;

class GoalsModules extends Model
{
    protected $table = 'goals_modules';
    protected $guarded = [];

    public function Data(){
        return $this->hasMany(GoalsModulesData::class,'goal_module_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(GoalsModulesData::class,'goal_module_id','id')->where('lang_id',Lang::getSelectedLangId());
    }

    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }
}
