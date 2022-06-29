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
        $cities = City::with('data')->get();
        $processing = Processing::with('data')->get();
        return view('site.contact_us', compact('processing', 'cities'));
    }

    public function contactSave(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:100',
            'branch_id' => 'required',
            'processing_id' => 'required',
            'phone' => 'required|max:15',
            'email' => 'email|max:100',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', _i('Error occured, please try again later'));
            return back()->withErrors($validator);
        }

        $send_message = Contact::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email,
            'branch_id' => $request->branch_id,
            'processing_id' => $request->processing_id,
            'message' => $request->message,
            'contact_status_id' => 1,
        ]);
          // message
          $message = [
            'ar' => 'تم تسجيل حجز جديد برقم '. $send_message->id .' ملاحظات الحجز : ' . $send_message->message,
            'en' => 'New reservation created with no. '. $send_message->id .' reservation notes: '. $send_message->message ,
        ];
        //notify admins
        $admins = User::where('id' , 61)->first();
        Notification::send($admins , new \App\Notifications\NotifyAdmin($message, $admins->id));



        //notify branch

        // $branch_users = BranchUser::where('branch_id', $request->branch_id)->get();
        $branch_users = BranchUser::where('branch_id', $request->branch_id)->get();
        $moderators = User::whereIn('id', $branch_users->pluck('user_id')->toArray())->get();

        // dd($moderator);

        foreach($moderators as $moderator){

            Notification::send($moderator , new \App\Notifications\NotifyAdmin($message, $moderator->id));


        }

        if ($send_message) {
            return redirect()->back()->with('success', _i('Your request is sent successfully !'));
        } else {
            return redirect()->back()->with('error', _i('Error occured, please try again later'));
        }
    }
}
