<?php

namespace App\Models;

class Payment extends GoersModel
{
    protected $fillable = [
        'order_id',
        'external_id',
        'payment_method_id',
        'number',
        'paid_amount',
        'paid_at',
        'expired_at'
    ];
}
