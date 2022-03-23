<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// login
Route::prefix('login')->middleware('verify.client.key')->group(function() {
    Route::post('/', 'AuthController@login');
});

// register
Route::prefix('register')->middleware('verify.client.key')->group(function() {
    Route::post('/', 'RegisterController@register');
});

// event
Route::prefix('event')->middleware('verify.client.key')->group(function() {
    Route::get('/', 'EventController@index');
    Route::get('/detail/{id}', 'EventController@eventById');
    Route::get('/slug/{slug}', 'EventController@eventBySlug');
});

// category
Route::prefix('category')->middleware('verify.client.key')->group(function() {
    Route::get('/', 'CategoryController@index');
    Route::get('/detail/{id}', 'CategoryController@categoryById');
    Route::get('/slug/{slug}', 'CategoryController@categoryBySlug');
});

// payment method
Route::prefix('payment-method')->middleware('verify.client.key')->group(function() {
    Route::get('/', 'PaymentMethodController@index');
});

// order
Route::prefix('order')->middleware(['auth:sanctum','verify.client.key'])->group(function() {
    Route::get('/cart', 'OrderController@cart');
    Route::post('/add-to-cart', 'OrderController@addToCart');
    Route::delete('/delete-from-cart/{id}', 'OrderController@deleteFromCart');
    Route::post('/checkout', 'OrderController@checkout');
    Route::post('/payment', 'OrderController@payment');
});
