<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PaymentMethod;

class PaymentMethodController extends Controller
{
    public function index()
    {
        $payment_methods = PaymentMethod::whereNull('deleted_at')->whereStatus('ACTIVE')->latest()->get();
        return response()->json(['status' => true, 'data' => $payment_methods]);
    }
   
}
