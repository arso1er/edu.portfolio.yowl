<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request) {
        $fields = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email:filter', 'max:255', 'unique:users'],
            'login' => ['required', 'string', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'max:255', 'confirmed'],
            'picture' => ['nullable', 'image', 'max:512'],
        ]);

        $userData = [
            'name' => $fields['name'],
            'email' => $fields['email'],
            'login' => $fields['login'],
            'password' => Hash::make($fields['password']),
            'role' => 'user' // not needed because default role is already user, but I need this field in the response
        ];

        if($request->hasfile('picture')) {
            $file = $request->file('picture');
            $newPicName = 'user-' . time() . "." . $file->extension();
            $file->move(public_path('images/users'), $newPicName);
            $pictureArray = ['picture' => "/images/users/$newPicName"];
        }

        $user = User::create(array_merge(
            $userData,
            $pictureArray ?? ['picture' => "/images/user-default.png"]
        ));

        $token = $user->createToken('mytokenkey')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 201);
    }

    public function login(Request $request) {
        $fields = $request->validate([
            'login' => ['required', 'string', 'max:255'],
            'password' => ['required', 'string', 'min:8', 'max:255'],
        ]);

        $user = User::where('email', $fields['login'])
                        ->orWhere('login', $fields['login'])
                        ->first();

        if(!$user || !Hash::check($fields['password'], $user->password)) {
            return response([
                'message' => 'Bad creds'
            ], 401);
        }

        $token = $user->createToken('mytokenkey')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token
        ];

        return response($response, 200);
    }

    public function logout(Request $request) {
        $request->user()->tokens()->delete();

        return [
            'message' => 'Logged out.'
        ];
    }
}
