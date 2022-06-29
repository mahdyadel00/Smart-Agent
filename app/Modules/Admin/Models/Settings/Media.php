<?php

namespace App\Modules\Admin\Models\Settings;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Products\Category;
use App\Modules\Admin\Models\Settings\MediaData;

class Media extends Model
{

    protected $table = 'media';
    protected $guarded = [];

    public function Data(){
        return $this->hasMany(MediaData::class,'media_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(MediaData::class,'media_id','id')->where('lang_id',Lang::getSelectedLangId());
    }

    public function getImageNameEncoded(){
        return dirname($this->photo).'/'.rawurlencode(basename($this->photo));
    }

}
