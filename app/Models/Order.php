<?php

namespace App\Models;

class Order extends GoersModel
{
    protected $fillable = [
        'customer_id',
        'payment_method_id',
        'order_reference',
        'total_line_items',
        'total_tax',
        'total_discount',
        'grand_total',
        'status'
    ];

	public function order_items()
	{
		return $this->hasMany(OrderItem::class, 'order_id');
	}

	public function payment_method()
	{
		return $this->belongsTo(PaymentMethod::class, 'payment_method_id');
	}

	public function customer()
	{
		return $this->belongsTo(Customer::class, 'customer_id');
	}
}
