<?php

namespace App\Models;

class EventImage extends GoersModel
{
    protected $fillable = [
        'event_id',
        'image'
    ];

	public function event()
	{
		return $this->belongsTo(Event::class, 'event_id');
	}
}
