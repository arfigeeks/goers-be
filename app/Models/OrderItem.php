<?php

namespace App\Models;

class OrderItem extends GoersModel
{
    protected $fillable = [
        'order_id',
        'event_id',
        'event_schedule_id',
        'price',
        'quantity',
        'total_tax',
        'total_discount',
        'amount_before_discount',
        'amount_amount_discount',
        'grand_total'
    ];

	public function order()
	{
		return $this->belongsTo(Order::class, 'order_id');
	}

	public function event()
	{
		return $this->belongsTo(Event::class, 'event_id');
	}

	public function event_schedule()
	{
		return $this->belongsTo(EventSchedule::class, 'event_schedule_id');
	}
}
