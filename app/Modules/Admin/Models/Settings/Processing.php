<?php

namespace App\Modules\Admin\Models\Settings;

use App\Bll\Lang;
use App\Models\Contact;
use App\Modules\Admin\Models\Products\Category;
use Illuminate\Database\Eloquent\Model;

class Processing extends Model
{

    protected $table = 'processing';
    protected $guarded = [];

    public function data(){
        return $this->hasOne(ProcessingData::class,'process_id','id')->where('lang_id',Lang::getSelectedLangId());
    }

}
