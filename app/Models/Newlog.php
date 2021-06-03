<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Newlog extends Model
{
    protected $table = 'newlog';

   	protected $fillable = [
       'incident_no', 'start_date','customer_id','received_via','customer_report_no','caller_person','hp_no','office_no','extension_no','email','description','remarks','due_date','total_downtime','category_id','problem_type','sla_code','severity','asset_sn','vendor','coordinator_name','coordinator_hp_no','coordinator_team','status','file'
    ];

    public function customer() {

    	return $this->belongsTo(Customer::class, 'customer_id','id')->orderby('company_name', 'asc');
    }

    public function category() {

    	return $this->belongsTo(Category::class, 'category_id','id')->orderby('category_name', 'asc');
    }

    public function newlog_has_survey() {

        return $this->hasMany(NewlogHasSurvey::class, 'newlog_id','id');
    }
}
