<?php

namespace App\Modules\Admin\Models\Settings;

use App\Bll\Lang;
use Illuminate\Database\Eloquent\Model;
use App\Modules\Admin\Models\Products\Category;
use App\Modules\Admin\Models\Settings\DoctorTeamData;
use Illuminate\Database\Eloquent\Relations\HasMany;

class DoctorTeam extends Model
{

    protected $table = 'doctor_teams';
    protected $guarded = [];

    public function Data()
	{
		return $this->hasMany(DoctorTeamData::class, 'doctor_teams_id', 'id');
	}

    public function TranslatedData()
	{
		return $this->hasOne(DoctorTeamData::class, 'doctor_teams_id', 'id')->where('lang_id',Lang::getSelectedLangId());
	}

	public function Social()
	{
		return $this->HasMany(DoctorSocial::class, 'doctor_teams_id', 'id');
	}

	public function getImageNameEncoded(){
        return dirname($this->photo).'/'.rawurlencode(basename($this->photo));
    }

}
