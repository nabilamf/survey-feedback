<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuestionSurvey extends Model
{
	protected $table = 'question_survey';

	protected $fillable = [
    'question_no', 'question', 'question_type', 'questionset_id', 'answer_1', 'answer_2', 'answer_3', 'answer_4', 
	];

	public function questionset() {

		return $this->belongsTo(QuestionSet::class, 'questionset_id','id')->orderby('set_name', 'asc');
	}
}
