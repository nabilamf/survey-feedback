<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewlogHasSurvey extends Model
{
    protected $table = 'newlog_has_survey';

    protected $fillable = [
        'newlog_id', 'questionset_id',
    ];

    public function newlog() {

    	return $this->belongsTo(Newlog::class, 'newlog_id','id');
    }

    public function questionset() {

    	return $this->belongsTo(QuestionSet::class, 'questionset_id','id');
    }
}
