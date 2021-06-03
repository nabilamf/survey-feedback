<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Mail;

class mailController extends Controller
{
    public function send(){
        
        $to_name = "bella";
        $to_email = 'nbellamf@gmail.com';
        // $data = '9541';

        Mail::send('mail', function($message) use ($to_name, $to_email) {
            $message->to($to_email, $to_name)
                    ->subject('IFICS')
                    ->from('nbellamf@gmail.com','Dx Team');
                    // ->attach('C:/xampp/htdocs/model/public/temp.pdf', [
                                // 'as' => 'Quotation SIC.pdf', 
                                // 'mime' => 'application/pdf'
            // ]);
        });

        // Mail::send (['text' => 'mail'], ['name', 'Nabila'], function($message){
        //     $message -> to ('nbellamf@gmail.com', 'To Bella') -> subject ('Test Email iFics');
        //     $message -> from ('nbellamf@gmail.com', 'From NbellaMF');
        // });
    }
}
