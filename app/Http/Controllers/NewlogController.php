<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\QuestionSet;
use App\Models\NewlogHasSurvey;
use App\Models\Category;
use App\Models\Customer;
use App\Models\NewLog;
use App\Models\User;
use Illuminate\Http\Request;
Use Mail;

class NewlogController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function send_store(Request $request, $newlog_id)
	{
		//dd($request);
		
		$newlog_has_survey = new NewlogHasSurvey;
		$newlog_has_survey->newlog_id = $newlog_id;
		$newlog_has_survey->questionset_id = $request->questionset_id;
		$newlog_has_survey->status = '';
		

		// $newlog_has_survey->newlog_id = $request->newlog_has_survey;

		// dd($newlog_has_survey->newlog_id = $newlog_id);

		$id = $newlog_has_survey->newlog_id = $newlog_id;
		$questionsets = $newlog_has_survey->questionset_id = $request->questionset_id;
		

		// $data = array('id' => $id, 'questionsets' => $questionsets);
        // $to_name = "Nabila";
		// $to_email = 'nbellamf@gmail.com';

		//dd($request->newlog_id= $request->caller_person);

		/******** ZAIM ******

			dd($newlog_has_survey);
			result:
			"newlog_id" => "5"
			"questionset_id" => "13"
			"status" => "Sent"
		
		********************/
		
		$newlog = Newlog::find($newlog_id); //new

		$email_blade = "emails.mail";
		$to_name = $newlog->caller_person; // new
		// $to_email = $newlog->email; // new
		$to_email = "nabilamf@heitech.com.my"; // new
		$subject = "IFICS Survey";
		$from_email = "heitech.ifics.survey@gmail.com";
		$from_name = "Customer Care Centre - HeiTech Padu Berhad Management";


		$tags = array();
		$values = array();
		$types = array();

		array_push($tags, 'Incident Number');
					array_push($values, $newlog->incident_no);
					array_push($types, 'string');
		
		// array_push($tags, 'Survey URL');
		// 			array_push($values, $);
		// 			array_push($types, 'string');

		$details = array();
			foreach($tags as $index=>$tag) {
				$temp = array("tag"=>$tag, "value"=>$values[$index], "type"=>$types[$index]);
				array_push($details, $temp);			
			}
				/************ End of Detail /************/
	
		$data = array('details' => $details,
					 'id' => $id,
					 'questionsets' => $questionsets,
					 'from_email' => $from_email);
		
		//dd($email_blade, $data, $to_name, $to_email, $subject, $from_email, $from_name); //new

		$result = app('App\Http\Controllers\MailController')->send($email_blade, $data, $to_name, $to_email, $subject, $from_email, $from_name);

		if($result != "SEND") {
			return back()->withError($result);
		}

		//dd($result);

		$newlog_has_survey->save();
		
		return redirect()->route('newlog.send', $newlog_id)->withStatus(__('Survey has been sent'));
        //   try {
        //     Mail::send('emails.mail', $data, function($message) use ($to_name, $to_email) {
        //       $message->to($to_email, $to_name)
        //           ->subject('IFICS')
        //           ->from('nanabbila@gmail.com','DX Team');
        //           // ->attach('C:/xampp/htdocs/model/public/temp.pdf', [
        //                 // 'as' => 'Quotation SIC.pdf', 
        //                 // 'mime' => 'application/pdf'
        //       // ]);
        //     });
        //   }
        //   catch(\Swift_TransportException | Exception $e) {
        //     dd($e->getMessage());
        //     // return back()->withStatus("Sorry. Server cannot be found. Please try again later.");
        //   }




	}

	public function send($id)
	{
		$newlog = Newlog::with('newlog_has_survey.questionset.surveytype')->find($id);

		
		// $surveytypes = array();
		// foreach ($newlog->newlog_has_survey as $newlog_has_survey) {
		// 	array_push($surveytypes, $newlog_has_survey->questionset->surveytype->survey_name);
		// }
		// dd($surveytypes);

		$questionsets = QuestionSet::with('surveytype')->where('lock_status', 'NO')->get();
		// dd($newlog, $questionsets);

		// $newlogs = Newlog::with('surveytype')->get();
	
		return view('newlog.send', compact('questionsets', 'newlog'));


	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$newlogs = NewLog::with('customer')->get();
		$news = NewLog::with('customer', 'newlog_has_survey')->doesnthave('newlog_has_survey')->get();
		$historys = NewLog::with('customer', 'newlog_has_survey')->has('newlog_has_survey')->get();
		
		//Update status dalam database
		// $temp = NewlogHasSurvey::find(69);
		// $temp->status = 'In Progress';
		// $temp->save();

		// dd($temp);

		return view('newlog.index', compact('newlogs', 'news', 'historys'));
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		$customers = Customer::all();
		$categorys = Category::all();
		return view('newlog.create', compact('customers', 'categorys'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{   
		//2020-05-12 14:08:21

		//dd(date('Y-m-d H:i:s', strtotime($request->start_date)));

		$newlog = new NewLog;
		$newlog->incident_no  = $request->incident_no;
		$newlog->start_date = date('Y-m-d H:i:s', strtotime($request->start_date));
		$newlog->customer_id = $request->customer_id;
		$newlog->caller_person = $request->caller_person;
		$newlog->hp_no = $request->hp_no;
		$newlog->office_no = $request->office_no;
		$newlog->extension_no = $request->extension_no;
		$newlog->email = $request->email;
		$newlog->total_downtime = $request->total_downtime;
		$newlog->status = $request->status;
		$newlog->save();

		
		// $newlog->description = $request->description;
		// $newlog->remarks = $request->remarks;
		// $newlog->file = $request->file;
		

		// $newlog->received_via = $request->received_via;
		// $newlog->customer_report_no = $request->customer_report_no;
		// $newlog->category_id = $request->category_id;
		// $newlog->problem_type = $request->problem_type;
		// $newlog->sla_code = $request->sla_code;
		// $newlog->severity = $request->severity;
		// $newlog->asset_sn = $request->asset_sn;
		// $newlog->vendor = $request->vendor;
		// $newlog->coordinator_name = $request->coordinator_name;
		// $newlog->coordinator_hp_no = $request->coordinator_hp_no;
		// $newlog->coordinator_team = $request->coordinator_team;
		

		// dd($newlog);
		return redirect()->route('newlog.index')->withStatus('New Log has been created.');

	}

	//Bukan email yg ni - tak guna function ni
	public function sendemail()
	{
        $data = array('name'=>"Hardik Parsania", "body" => "Gmail from Laravel");
        $to_name = "Nabila";
		$to_email = 'nbellamf@gmail.com';

        // Mail::send('mail', $data, function($message) {
        //     $message->to('nbellamf@gmail.com', 'Bella')
        //     ->subject('From Laravel With Gmail');
        //     $message->from('nanabbila@gmail.com',' BellaDX');
 
        //   });
 
        //   if (Mail::failures()) {
        //     return response()->Fail('Sorry! Please try again latter');
        //   }else{
        //     return response()->json('Yes, You have sent email to GMAIL nbellamf from LARAVEL 5.8 !!');
        //   }

          try {
            Mail::send('mail', $data, function($message) use ($to_name, $to_email) {
              $message->to($to_email, $to_name)
                  ->subject('IFICS')
                  ->from('nanabbila@gmail.com','Nabila Team');
                  // ->attach('C:/xampp/htdocs/model/public/temp.pdf', [
                        // 'as' => 'Quotation SIC.pdf', 
                        // 'mime' => 'application/pdf'
              // ]);
            });
          }
          catch(\Swift_TransportException | Exception $e) {
            dd($e->getMessage());
            // return back()->withStatus("Sorry. Server cannot be found. Please try again later.");
          }
   }

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		$newlog = NewLog::with('customer', 'category')->where('id', $id)->first();
		return view('newlog.show', compact('newlog'));

	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		$newlog = NewLog::find($id);
		$customers = Customer::all();
		$categorys = Category::all();
		return view('newlog.edit', compact('newlog', 'customers', 'categorys'));
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
		$newlog = NewLog::find($id);
		$newlog->incident_no  = $request->incident_no;
		$newlog->customer_id = $request->customer_id;
		// $newlog->received_via = $request->received_via;
		// $newlog->customer_report_no = $request->customer_report_no;
		$newlog->caller_person = $request->caller_person;
		$newlog->hp_no = $request->hp_no;
		$newlog->office_no = $request->office_no;
		$newlog->extension_no = $request->extension_no;
		$newlog->email = $request->email;
		// $newlog->description = $request->description;
		// $newlog->remarks = $request->remarks;
		
		if ($request->status == 'Closed') {

			$newlog->due_date = Carbon::now();

			$start_date = new Carbon($newlog->start_date);
			$due_date = new Carbon($newlog->due_date);
			$temp_total_downtime = $due_date->diff($start_date);
			$newlog->total_downtime = $temp_total_downtime->d . ' days ' . $temp_total_downtime->h . ' hours ' . $temp_total_downtime->i . ' minutes';
			// $newlog->total_downtime = $due_date->diff($start_date);
			// dd($start_date, $due_date, $newlog->total_downtime->d, $newlog->total_downtime->h, $newlog->total_downtime->i);

		} else {
			
			$newlog->due_date = null;
			$newlog->total_downtime = null;
		}

		// $newlog->category_id = $request->category_id;
		// $newlog->problem_type = $request->problem_type;
		// $newlog->sla_code = $request->sla_code;
		// $newlog->severity = $request->severity;
		// $newlog->asset_sn = $request->asset_sn;
		// $newlog->vendor = $request->vendor;
		// $newlog->coordinator_name = $request->coordinator_name;
		// $newlog->coordinator_hp_no = $request->coordinator_hp_no;
		// $newlog->coordinator_team = $request->coordinator_team;
		$newlog->status = $request->status;
		// $newlog->file = $request->file;
		$newlog->save();

		return redirect()->route('newlog.index')->withStatus('New Log has been updated.');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		$newlog = NewLog::find($id);
		$newlog->delete();
		
		return redirect()->route('newlog.index')->withStatus('New Log has been deleted.');
	}

	// public function newlog_has_survey(Request $request) 
    // {
    //     $newloghassurvey = NewlogHasSurvey::find($request->id);
    //     // $role->revokePermissionTo(Permission::all());

    //     foreach ($request->newlog_has_survey as $newlog_has_survey) {
    //         if($newlog_has_survey != '0') {
    //             $n = NewlogHasSurvey::find($newlog_has_survey);
    //             $newloghassurvey->$p->name;
    //         }
    //     }

    //     return redirect()->route('roles.index');
    // }
}
