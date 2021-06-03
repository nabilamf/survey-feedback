<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SurveyType extends Model
{
    protected $table = 'survey_type';

    protected $fillable = [
        'survey_name',
    ];
}
