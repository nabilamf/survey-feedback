<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Mail;
// use App\Mail\MailUser;

Use Mail;

class UserCnr extends Controller
{
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
}