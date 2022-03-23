<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Hash, Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'email'=>'required|email',
            'name'=>'required|string',
            'password'=>'required|string|min:8'
        ]);

        if ($validator->fails()) {
            $messages = $validator->messages();
            return response()->json(['status' => false, 'message' => $messages]);
        }

        $store = new Customer;
        $store->fill($request->all());
        $store->password = Hash::make($request->password);
        $store->status = 'INACTIVE';
        
        if($store->save()){
            return response()->json(['status' => true, 'message' => 'Registration successfully.']);
        }
        return response()->json(['status' => false, 'message' => 'Registration failed.']);
    }
}
