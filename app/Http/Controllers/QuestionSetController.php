<?php

namespace App\Http\Controllers;

use App\Models\SurveyType;
use App\Models\QuestionSet;
use Illuminate\Http\Request;

class QuestionSetController extends Controller
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
        $questionsets = QuestionSet::with('surveytype')->get();
        return view('questionset.index', compact('questionsets'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $surveytypes = SurveyType::all();
        return view('questionset.create', compact('surveytypes'));
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
        $questionset = new QuestionSet;
        $questionset->set_name = $request->name;
        $questionset->surveytype_id = $request->surveytype_id;
        $questionset->save();

        return redirect()->route('questionset.index')->withStatus('Question Set has been created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\QuestionSet  $questionSet
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $questionset = QuestionSet::with('surveytype', 'questionsurvey')->where('id', $id)->first();
        return view('questionset.show', compact('questionset'));
    }

    public function lock($id)
    {
        $questionset = QuestionSet::find($id);

        if ($questionset->lock_status == 'NO')
        {
            $questionset->lock_status = 'YES';
            $questionset->save();
        }

        // return redirect()->route('questionset.show', $id)->withStatus('Successfuly Locked.');
       
        else 
            $questionset->lock_status = 'NO';
            $questionset->save();
        
        return redirect()->route('questionset.show', $id)->withStatus('Successfuly Updated');

        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\QuestionSet  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $questionset = QuestionSet::find($id);
        $surveytypes = SurveyType::all();

        if ($questionset->lock_status == 'YES')
            return redirect()->route('questionset.index')->withError('Question Set has been LOCK!');

        return view('questionset.edit', compact('questionset', 'surveytypes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\QuestionSet  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $questionset = QuestionSet::find($id);

        if ($questionset->lock_status == 'YES')
            return redirect()->route('questionset.index')->withError('Question Set has been LOCK!');

        $questionset->set_name = $request->name;
        $questionset->surveytype_id = $request->surveytype_id;
        $questionset->save();

        if ($questionset->lock_status == 'NO')
            return redirect()->route('questionset.index')->withError('Question Set has been UNLOCKED!');

        $questionset->set_name = $request->name;
        $questionset->surveytype_id = $request->surveytype_id;
        $questionset->save();


         return redirect()->route('questionset.index')->withStatus('Question Set has been updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\QuestionSet  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $questionset = QuestionSet::find($id);
        $questionset->delete();
        
        return redirect()->route('questionset.index')->withStatus('Question Set has been deleted.');
    }
}
