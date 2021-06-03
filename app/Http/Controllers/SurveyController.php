<?php

namespace App\Http\Controllers;

use App\Models\NewLog; 
use App\Models\QuestionSet;
use Illuminate\Http\Request;

class SurveyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id_newlog, $id_questionset)
    {
        $newlog = NewLog::find($id_newlog);
        $questionset = QuestionSet::find($id_questionset);

        return view('survey.index', compact('newlog', 'questionset'));
        // dd($newlog, $questionset->surveytype->survey_name, $questionset->questionsurvey);
    }

    public function surveyview($id_newlog, $id_questionset)
    {
        $newlog = NewLog::find($id_newlog);
        $questionset = QuestionSet::find($id_questionset);

        return view('survey.surveyview', compact('newlog', 'questionset'));
        // dd($newlog, $questionset->surveytype->survey_name, $questionset->questionsurvey);
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
