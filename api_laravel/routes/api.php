<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/comments', function() {
    // return 'comments';

    // Test database connection
    try {
        DB::connection()->getPdo();
        die("Working");
    } catch (\Exception $e) {
        die("Could not connect to the database.  Please check your configuration. error:" . $e->getMessage() );
    }
});