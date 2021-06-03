<?php

namespace App\Http\Controllers;

use App\Models\QuestionSet;
use App\Models\QuestionSurvey;
use Illuminate\Http\Request;

class QuestionSurveyController extends Controller
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
    public function index()
    {
        $questionsurveys = QuestionSurvey::with('questionset.surveytype')->whereHas('questionset', function($query){
                $query->where('lock_status', 'NO');
            })->get();
        return view('questionsurvey.index', compact('questionsurveys'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $questionsets = QuestionSet::with('surveytype')->where('lock_status', 'NO')->get();
        return view('questionsurvey.create', compact('questionsets'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request);
        $questionsurvey = new QuestionSurvey;
        $questionsurvey->question_no = $request->question_no;
        $questionsurvey->question = $request->question;
        $questionsurvey->questionset_id = $request->questionset_id;
        $questionsurvey->question_type = $request->question_type;
        $questionsurvey->answer_1 = $request->answer_1;
        $questionsurvey->answer_2 = $request->answer_2;
        $questionsurvey->answer_3 = $request->answer_3;
        $questionsurvey->answer_4 = $request->answer_4;
        $questionsurvey->save();

        return redirect()->route('questionsurvey.index')->withStatus('Question Survey has been created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\QuestionSurvey  $questionSurvey
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\QuestionSurvey  $questionSurvey
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $questionsurvey = QuestionSurvey::find($id);
        $questionsets = QuestionSet::with('surveytype')->where('lock_status', 'NO')->get();
        return view('questionsurvey.edit', compact('questionsurvey', 'questionsets'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\QuestionSurvey  $questionSurvey
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $questionsurvey = QuestionSurvey::find($id);
        $questionsurvey->question_no = $request->question_no;
        $questionsurvey->question = $request->question;
        $questionsurvey->questionset_id = $request->questionset_id;
        $questionsurvey->question_type = $request->question_type;
        $questionsurvey->answer_1 = $request->answer_1;
        $questionsurvey->answer_2 = $request->answer_2;
        $questionsurvey->answer_3 = $request->answer_3;
        $questionsurvey->answer_4 = $request->answer_4;
        $questionsurvey->save();

         return redirect()->route('questionsurvey.index')->withStatus('Question Survey has been updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\QuestionSurvey  $questionSurvey
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $questionsurvey = QuestionSurvey::find($id);
        $questionsurvey->delete();
        
        return redirect()->route('questionsurvey.index')->withStatus('Question Survey has been deleted.');
    }
}
