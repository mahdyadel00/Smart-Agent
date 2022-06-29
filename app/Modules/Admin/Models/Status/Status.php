<?php

namespace App\Modules\Admin\Models\Status;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use PhpOffice\PhpSpreadsheet\Calculation\Web\Service;

class Status extends Model
{
    protected $table = 'contact_status';
    protected $guarded = [];

}
