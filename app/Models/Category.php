<?php

namespace App\Models;

class Category extends GoersModel
{
    protected $fillable = [
        'name',
    ];

	public function event_categories()
	{
		return $this->hasMany(EventCategory::class, 'category_id');
	}
}
