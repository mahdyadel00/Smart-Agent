<?php

namespace App\Modules\Portal\Controllers;

use App\Models\User;
use App\Models\Contact;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Modules\Admin\Models\Settings\City;
use Illuminate\Support\Facades\Notification;
use App\Modules\Admin\Models\Branch\BranchUser;
use App\Modules\Admin\Models\Settings\Processing;

class ContactController extends Controller
{

    public function contact_us()
    {
        return view('site.contact_us');
    }

    public function contactSave(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:100',
            'phone' => 'required|max:15',
            'email' => 'email|max:100',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', _i('Error occured, please try again later'));
            return back()->withErrors($validator);
        }

        $send_message = Contact::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'subject' => $request->subject,
            'message' => $request->message,
        ]);
          // message
          $message = [
            'ar' => 'تم تسجيل حجز جديد برقم '. $send_message->id .' ملاحظات الحجز : ' . $send_message->message,
            'en' => 'New reservation created with no. '. $send_message->id .' reservation notes: '. $send_message->message ,
        ];

        if ($send_message) {
            return redirect()->back()->with('success', _i('Your request is sent successfully !'));
        } else {
            return redirect()->back()->with('error', _i('Error occured, please try again later'));
        }
    }
}
