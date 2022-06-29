<?php

namespace App\Modules\Admin\Models\Products;

use App\SiteCommonQuestion;
use Illuminate\Database\Eloquent\Model;

class QuestionData extends Model
{
    protected $table = 'questions_data';
    protected $guarded = [];

    public $appends = ['picture'];

    public function getPictureAttribute(){
        return dirname($this->image).'/'.rawurlencode(basename($this->image));
    }

}
