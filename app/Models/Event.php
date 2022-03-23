<?php

namespace App\Models;

class Event extends GoersModel
{
    protected $fillable = [
        'name',
        'description',
        'address',
        'latitude',
        'longitude',
        'status',
    ];

	public function event_categories()
	{
		return $this->hasMany(EventCategory::class, 'event_id');
	}

	public function event_images()
	{
		return $this->hasMany(EventImage::class, 'event_id');
	}

	public function event_schedules()
	{
		return $this->hasMany(EventSchedule::class, 'event_id');
	}

	public function creator()
	{
		return $this->belongsTo(User::class, 'created_by');
	}
}
