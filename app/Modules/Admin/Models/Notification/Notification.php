<?php

namespace App\Modules\Admin\Models\Notification;

use App\Bll\Lang;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use PhpOffice\PhpSpreadsheet\Calculation\Web\Service;

class Notification extends Model
{
    protected $table = 'notifications';
    protected $guarded = [];
    protected $casts = [
        'id' => 'string',
    ];

    public function user(){
        return $this->belongsTo(User::class,'notifiable_id','id');
    }

}
