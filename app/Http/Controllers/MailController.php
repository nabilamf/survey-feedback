<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Mail;

class MailController extends Controller
{
    public function send($a, $b, $c, $d, $e, $f, $g){
        
        try {
			Mail::send($a, $b, function($message) use ($c, $d, $e, $f, $g) {
				$message->to($d, $c)
						->subject($e)
						->from($f, $g);
			});
		}
		catch(\Swift_TransportException | Exception $e) {
			return $e->getMessage();
			// return back()->withError("Sorry. Server cannot be found. Please try again later.");
		}

		return 'SEND';
        // $to_name = "bella";
        // $to_email = 'nbellamf@gmail.com';
        // // $data = '9541';

        // Mail::send('mail', function($message) use ($to_name, $to_email) {
        //     $message->to($to_email, $to_name)
        //             ->subject('IFICS')
        //             ->from('nbellamf@gmail.com','Dx Team');
        //             // ->attach('C:/xampp/htdocs/model/public/temp.pdf', [
        //                         // 'as' => 'Quotation SIC.pdf', 
        //                         // 'mime' => 'application/pdf'
        //     // ]);
        // });

        // Mail::send (['text' => 'mail'], ['name', 'Nabila'], function($message){
        //     $message -> to ('nbellamf@gmail.com', 'To Bella') -> subject ('Test Email iFics');
        //     $message -> from ('nbellamf@gmail.com', 'From NbellaMF');
        // });
    }
}
