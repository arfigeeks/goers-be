<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Customer extends Authenticatable
{

    use HasApiTokens;

    protected $fillable = [
        'name',
        'email',
        'email_verified_at',
        'phone',
        'gender',
        'status'
    ];

    protected $hidden = [
        'password',
    ];

	public function orders()
	{
		return $this->hasMany(Order::class, 'customer_id');
	}
}
