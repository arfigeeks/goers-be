<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;

class EventController extends Controller
{
    public function index()
    {
        $events = Event::whereNull('deleted_at')->whereStatus('ACTIVE')->with(['event_categories.category','event_images','event_schedules','creator'])->latest()->get();
        return response()->json(['status' => true, 'data' => $events]);
    }
   
    public function eventById($id)
    {
        $event = Event::findOrFail($id)->with(['event_categories.category','event_images','event_schedules'])->first();
        if($event) return response()->json(['status' => true, 'data' => $event]);
        else return response()->json(['status' => false, 'message' => 'Event not available.']);
    }

    public function eventBySlug($slug)
    {
        $event = Event::where('slug', $slug)->with(['event_categories.category','event_images','event_schedules','creator'])->first();
        if($event) return response()->json(['status' => true, 'data' => $event]);
        else return response()->json(['status' => false, 'message' => 'Event not available.']);
    }
}
