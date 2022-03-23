<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Hash, Validator, Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'email'=>'required|email',
            'password'=>'required|string|min:8'
        ]);

        if ($validator->fails()) {
            $messages = $validator->messages();
            return response()->json(['status' => false, 'message' => $messages]);
        }

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $token = Auth::user()->createToken('auth_token')->plainTextToken;
            return response()->json(['status' => true, 'data' => Auth::user(), 'token' => $token]);
        }
        return response()->json(['status' => false, 'message' => 'Login failed.']);
    }

}
