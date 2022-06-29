<?php

namespace App\Modules\Admin\Models\Login;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Login\LoginData;

class Login extends Model
{
    protected $table = 'login';
    protected $guarded = [];

    public function Data(){
        return $this->hasOne(LoginData::class,'login_id','id');
    }

    public function TranslatedData(){
        return $this->hasOne(LoginData::class,'login_id','id')->where('lang_id',Lang::getSelectedLangId());
    }
    public function getImageNameEncoded(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
