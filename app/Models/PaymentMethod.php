<?php

namespace App\Models;

class PaymentMethod extends GoersModel
{
    protected $fillable = [
        'code',
        'name',
        'logo',
        'status'
    ];

	public function orders()
	{
		return $this->hasMany(Order::class, 'payment_method_id');
	}
}
