<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SurveyAns extends Model
{
    protected $table = 'survey_ans';

   	protected $fillable = [
       'newlog_id', 'questionset_id','question_no','survey_ans','created_at','updated_at'];

    public function newlog() {

    	return $this->belongsTo(Newlog::class, 'newlog_id','id');
    }

    public function questionSet() {

    	return $this->belongsTo(QuestionSet::class, 'questionset_id','id');
    }

}
