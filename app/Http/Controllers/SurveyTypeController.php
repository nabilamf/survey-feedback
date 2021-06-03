<?php

namespace App\Http\Controllers;

use App\Models\SurveyType;
use Illuminate\Http\Request;

class SurveyTypeController extends Controller
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
        $surveytypes = SurveyType::all();
        return view('surveytype.index', compact('surveytypes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
         return view('surveytype.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->question);
        $surveytype = new SurveyType;
        $surveytype->survey_name = $request->type;
        $surveytype->save();

        return redirect()->route('surveytype.index')->withStatus('Survey type has been created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $surveytype = SurveyType::with('surveytype', 'questionsurvey')->where('id', $id)->first();
		// return view('surveytype.show', compact('surveytype'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $surveytype = SurveyType::find($id);
        return view('surveytype.edit', compact('surveytype'));
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
        $surveytype = SurveyType::find($id);
        $surveytype->survey_name = $request->type;
        $surveytype->save();

         return redirect()->route('surveytype.index')->withStatus('Survey type has been updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $surveytype = SurveyType::find($id);
        $surveytype->delete();
        
        return redirect()->route('surveytype.index')->withStatus('Survey type has been deleted.');
    }
}
