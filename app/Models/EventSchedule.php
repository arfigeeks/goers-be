<?php

namespace App\Models;

class EventSchedule extends GoersModel
{
    protected $fillable = [
        'event_id',
        'name',
        'date',
        'start_time',
        'end_time',
        'price',
        'max_quantity',
        'description'
    ];

	public function event()
	{
		return $this->belongsTo(Event::class, 'event_id');
	}
}
