<?php

namespace App\Modules\Admin\Models\Products;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';
    protected $guarded = [];

    public function data()
    {
        return $this->hasMany(QuestionData::class , 'question_id' , 'id');
    }

    public function TranslatedData()
    {
        return $this->hasOne(QuestionData::class,'question_id','id')->where('lang_id',Lang::getSelectedLangId());
        }

}
