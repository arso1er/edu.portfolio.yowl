<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Models\User;
use Auth;
use App\Models\Comment;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::where('id', $id)
                            ->first();

        $response = [
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'picture' => $user->picture,
            ],
        ];

        return response($response, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $currentUser = Auth::user();

        if((int)$currentUser->id !== (int)$id && $currentUser->role !== 'admin') {
            return response()->json(['message' => 'You are not allowed to do that!'], 403);
        }

        $fields = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'login' => ['required', 'string', 'max:255', 'unique:users,login,' .$id],
            'password' => ['nullable', 'string', 'min:8', 'max:255', 'confirmed', 'same:password_confirmation'],
            'picture' => ['nullable', 'image', 'max:512'],
        ]);

        $data = [
            'name' => $fields['name'],
            'login' => $fields['login'],
        ];

        if($request->file('picture')) {
            $newPicName = 'user-' . time() . "." . $request->file('picture')->extension();
            $request->file('picture')->move(public_path('images/users'), $newPicName);
            $pictureArray = ['picture' => "/images/users/$newPicName"];
        }

        if($request->input('password')) {
            $passArray = ['password' => Hash::make( $request->input('password') )];
        }

        if($currentUser->role === "admin") {
            $roleArray = ['role' => $request->input('role')];
        }

        $newUser = tap(User::where('id', $id))
                    ->update(array_merge(
                        $data,
                        $pictureArray ?? [],
                        $passArray ?? [],
                        $roleArray ?? [],
                    ))
                    ->first();

        $response = [
            'status' => 'success',
            'message' => 'The user has been updated successfully!',
            'user' => $newUser
        ];
        return response($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $currentUser = Auth::user();
        if((int)$currentUser->id !== (int)$id && $currentUser->role !== 'admin') {
            return response()->json(['message' => 'You are not allowed to do that!'], 403);
        }

        $deletedUser = User::where('id', $id)->delete();
        $deletedComment = Comment::where('user_id', $id)->delete();
        $message = 'Your account has been successfully deleted!';
        if($currentUser->role === 'admin' && (int)$currentUser->id !== (int)$id) {
            $message = 'The user has been deleted successfully!';
        }

        $response = [
            'status' => 'success',
            'message' => $message
        ];
        return response($response, 200);
    }
}
