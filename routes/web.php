<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\ApiController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::resource('roles', App\Http\Controllers\RolesController::class);
Route::resource('qrcodes', App\Http\Controllers\QrcodeController::class);
Route::resource('transactions', App\Http\Controllers\TransactionController::class);
Route::resource('users', App\Http\Controllers\UserController::class);

Route::post('pay', [App\Http\Controllers\PaymentController::class, 'pay'])->name('payment'); 
Route::get('success', [App\Http\Controllers\PaymentController::class, 'success']); 
Route::get('error', [App\Http\Controllers\PaymentController::class, 'error']);

// Route::post('/generate-token/{user}', 'TokenController@generateToken')->name('generate-token');

Route::post('generateToken/{user}', [App\Http\Controllers\TokenController::class, 'generateToken'])->name('generate-token');

Route::middleware('auth:sanctum')->get('/user', function(Request $request){

return $request->user();

});