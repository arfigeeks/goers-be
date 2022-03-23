<?php

namespace App\Http\Middleware;

use Closure;

class VerifyClientKey
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $clientKey  = $request->header('client_key');
        if($clientKey == env('CLIENT_KEY')){
            return $next($request);
        }
        return response()->json(['status' => false,'message' => "Invalid client key"], 503);
    }
}
