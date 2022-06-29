<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Branch\Branch;
use App\Modules\Admin\Models\Status\Status;
use App\Modules\Admin\Models\Settings\Processing;

class Contact extends Model
{
    protected $table = 'contacts';
    protected $guarded = [];

    public function processing(){

        return $this->hasOne(Processing::class , 'id' , 'processing_id');
    }
    public function branch(){
        return $this->hasOne(Branch::class , 'id' , 'branch_id');
    }
    public function status(){
        return $this->hasOne(Status::class , 'id' , 'contact_status_id');
    }

}
