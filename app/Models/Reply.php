<?php

namespace App\Models;

use App\Models\Contact;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Settings\Processing;

class Reply extends Model
{
    protected $table = 'replys';
    protected $guarded = [];

    public function contact(){
        return $this->hasOne(Contact::class , 'id' , 'contact_id');
    }
    public function user(){
        return $this->hasOne(User::class , 'id' , 'user_id');
    }

}
