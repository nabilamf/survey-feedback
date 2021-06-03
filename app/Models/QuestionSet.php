<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuestionSet extends Model
{
   	protected $table = 'question_set';

   	protected $fillable = [
       'set_name', 'surveytype_id', 'lock_status'
   	];

   	public function surveytype() {

   		return $this->belongsTo(SurveyType::class, 'surveytype_id','id')->orderby('survey_name', 'asc');
   	}

   	public function questionsurvey() {

   		return $this->hasMany(QuestionSurvey::class, 'questionset_id','id')->orderby('question_no', 'asc');
   	}

      public function newlog_has_survey() {

        return $this->hasMany(NewlogHasSurvey::class, 'questionset_id','id');
    }
}
