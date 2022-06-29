<?php

namespace App\Modules\Admin\Controllers\Contact;

use App\Bll\Utility;
use App\Http\Controllers\Controller;
use App\Models\Contact;
use App\Models\Reply;
use App\Models\User;
use App\Modules\Admin\Models\Branch\Branch;
use App\Modules\Admin\Models\Branch\BranchUser;
use App\Modules\Admin\Models\Status\Status;
use App\Notifications\NotifyAdmin;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Yajra\DataTables\Facades\DataTables;

class ContactsController extends Controller
{

    protected function index(Request $request)
    {
     

            $contacts = Contact::get();
               

        if (request()->ajax()) {
            return DataTables::of($contacts)
                ->addColumn('option', function ($query) {
                    $html = '<a class="btn btn-info mx-1" href="' . route('contacts.show', $query->id) . '"> <i class="fa fa-eye"></i></a>';
                    $html .= '<a  class="btn btn-danger mx-1" href="' . route('contacts.delete', $query->id) . '"><i class="ti-trash"></i></a>';
                    return $html;
                })
                ->rawColumns([
                    'option',
                ])
                ->make(true);
        }
        return view('admin.contacts.index');
    }
    protected function show($id)
    {
        $contact = Contact::query()->find($id);
        
        return view('admin.contacts.show', compact('contact'));
    }
    protected function update(Request $request, $id)
    {
      
         $contact_status = Contact::where('id' , $id)->first();
        // message
        $message = [
            'ar' => ' تم تحديث حالة الحجز رقم '. $contact_status->id .'  الى ' . $contact_status->status->status . ' وميعاد الحجز ' . Utility::dates($contact_status->reservation_date),
            'en' => ' Reservation no. '. $contact_status->id .' status updated to  ' . $contact_status->status->status . ' And the reservation date is  ' . Utility::dates($contact_status->reservation_date),
        ];
       
        return redirect()->back()->with('Successfully');
    }

    protected function delete($id)
    {
        Contact::query()->find($id)->delete();
        session()->flash('message', _i('Deleted successfully'));
        return redirect('admin/contacts');
    }

    protected function reply(Request $request, $id)
    {
        $contact = Contact::find($id);
        $reply = Reply::create([

            'contact_id' => $id,
            'user_id' => Auth::user()->id,
            'message' => $request->message,
        ]);
        // message
        $message = [
            'ar' => 'يوجد ملاحظه على حجز رقم ' . $id . ' : ' . $reply->message,
            'en' => 'There is a note on reservation with no. ' . $id . ' : ' . $reply->message,
        ];
        //notify admins
        $admins = User::where('id', 61)->first();
        Notification::send($admins, new \App\Notifications\NotifyAdmin($message, $admins->id));

        //notify branch

        $branch_users = BranchUser::where('branch_id', $contact->branch_id)->get();
        $moderators = User::whereIn('id', $branch_users->pluck('user_id')->toArray())->get();

        foreach ($moderators as $moderator) {

            Notification::send($moderator, new \App\Notifications\NotifyAdmin($message, $moderator->id));

        }
        return redirect()->back()->with('success', _i('Reply sent successfully'));
    }
}
