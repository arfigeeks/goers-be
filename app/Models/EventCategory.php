<?php

namespace App\Models;

class EventCategory extends GoersModel
{
    protected $fillable = [
        'category_id',
        'event_id'
    ];

	public function category()
	{
		return $this->belongsTo(Category::class, 'category_id');
	}

}
