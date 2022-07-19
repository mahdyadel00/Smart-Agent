<?php

namespace App\Modules\Portal\Controllers;

use App\Bll\Lang;
use App\Http\Controllers\Controller;
use App\Modules\Admin\Models\Products\Question;
use App\Modules\Admin\Models\Products\Answer;
use App\Modules\Admin\Models\Products\QuestionDetails;
use Illuminate\Http\Request;

class QuizController extends Controller
{


    protected function index()
    {
        $question_details = QuestionDetails::first();
        $questions = Question::with('data')->get();

        return view('site.questions.index', compact('questions', 'question_details'));
    }

    protected function store(Request $request)
    {

//         dd($request->all());
        // if ($request->has('published')) {

        //     $question->published = $request->published;
        // } else {

        //     $question->published = 0;
        // }
        $answer = Answer::query()->create([

            'answer' => $request->true ?? 0,
        ]);

        if ($answer) {
            return redirect()->back()->with('success', _i('Your request is sent successfully !'));
        } else {
            return redirect()->back()->with('error', _i('Error occured, please try again later'));
        }
    }
}
