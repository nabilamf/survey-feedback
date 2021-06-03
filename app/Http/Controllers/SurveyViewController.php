<?php

namespace App\Http\Controllers;

use App\Models\NewLog; 
use App\Models\QuestionSet;
use App\Models\SurveyAns;
use App\Models\QuestionSurvey;
use App\Models\NewlogHasSurvey;
use Illuminate\Http\Request;

class SurveyViewController extends Controller
{
   
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function surveyview($id_newlog, $id_questionset)
    {
        $newlog = NewLog::find($id_newlog);
        $questionset = QuestionSet::find($id_questionset);

        if($newlog_has_survey = NewlogHasSurvey::where('newlog_id', $id_newlog)->where('questionset_id', $id_questionset)->first()->status=='Completed'){

            return redirect()->route('survey.surveysuccess', ['newlog_id' => $id_newlog, 'questionset_id' =>$id_questionset]);

        }

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
        // dd($request);

        $flag = true;

        foreach($request->question_id as $index=>$id)
        {
            $question = QuestionSurvey::find($id);

            if (SurveyAns::where('newlog_id', $request->newlog_id)->where('questionset_id', $request->questionset_id)->where('question_no',($index+1))->first() == null) {
                $survey_ans = new SurveyAns;
                // dd('if',$survey_ans);
            }
            else{
                $survey_ans = SurveyAns::where('newlog_id', $request->newlog_id)->where('questionset_id', $request->questionset_id)->where('question_no', ($index+1))->first();
                // dd('else',$survey_ans);

            }



            // dd(SurveyAns::where('newlog_id', $request->newlog_id)->where('questionset_id', $request->questionset_id)->where('question_no', $request->question_no)->first());

            $survey_ans->newlog_id = $request->newlog_id;
            $survey_ans->questionset_id = $request->questionset_id;
            $survey_ans->question_no = $index+1;

            // dd($index,$request->answer, $request->answer[1]);

            // if($request->answer[$index] != null) {

            try{
                 $survey_ans->survey_ans = $request->answer[$index];
            
                 $survey_ans->save();
            }
            
            catch (\Exception $e) {

               $flag = false;
               // dd($flag);
            }

            // dd($flag);

            // else{
            //     $flag = false;
            // }
        }

        $newlog_has_survey = NewlogHasSurvey::where('newlog_id', $request->newlog_id)->where('questionset_id', $request->questionset_id)->first();

        if($flag){
            $newlog_has_survey->status = 'Completed';
        }

        else{
            $newlog_has_survey->status = 'In Progress';
        }
        $newlog_has_survey->save();

           

            // $surveysuccess = [
            //     'success' => 'Survey saved successfully',
            //     'newlog_id' => $request->newlog_id, 
            //     'questionset_id' =>$request->questionset_id,
            // ];

            // return redirect()->route('survey.surveyview')->withStatus('Question Set has been created.');
            return redirect()->route('survey.surveysuccess', ['newlog_id' => $request->newlog_id, 'questionset_id' =>$request->questionset_id]);
            // return redirect()->back()->with($surveysuccess);
            // dd($surveysuccess);

            // contoh -- return view('customer.edit', compact('customer')); -- compact untuk hantar parameter ke view  
        


    }

    public function surveysuccess($id_newlog, $id_questionset)
    {
        $newlog = NewLog::find($id_newlog);
        $questionset = QuestionSet::find($id_questionset);

        return view('survey.surveysuccess', compact('newlog', 'questionset'));
        // dd($newlog, $questionset->surveytype->survey_name, $questionset->questionsurvey);
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


