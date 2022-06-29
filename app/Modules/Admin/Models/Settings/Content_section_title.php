<?php

namespace App\Modules\Admin\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class Content_section_title extends Model
{
    protected $guarded = [];
    protected $table = 'content_section_titles';

    public function contentdata(){
        return $this->belongsTo(Content_section::class);
    }

}
