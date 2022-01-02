<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Comment;

use DB;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Get params
        $site = $request->query('site', '') ?? '';
        $stars = $request->query('stars', '') ?? '';
        $user = $request->query('user', '') ?? '';
        $sort = $request->query('sort', 'id desc') ?? 'id desc';

        $stars_str = trim($stars) === "" ? "" : "AND rating IN ($stars)";
        $user_str = trim($user) === "" ? "" : "AND user_id = $user";
        // var_dump($stars_str);

        // Count query
        // https://stackoverflow.com/questions/50105417/combining-two-where-statements
        $countStdClass = DB::select(DB::raw("
            SELECT COUNT(*) as total FROM comments
            WHERE 
                (site_link LIKE \"%$site%\" OR site_name LIKE \"%$site%\")
            $stars_str
            $user_str
            ORDER BY $sort
        "));
        $count = (array) $countStdClass[0];

        // $startAt; $perPage; $title; $category; $sort; $min_price; $max_price;
        $perPage = $request->query('per_page', '10') ?? '10';
        $page = $request->query('page', 1) ?? 1;
        $startAt = $perPage * ($page - 1);
        $totalPages = ceil($count['total'] / ($perPage == 0 ? 10 : $perPage));

        $comments = DB::select(DB::raw("
            SELECT comments.*, users.name as userName, users.picture as userPicture
            FROM comments
            INNER JOIN users
            ON comments.user_id = users.id
            WHERE
                (site_link LIKE \"%$site%\" OR site_name LIKE \"%$site%\")
            $stars_str
            $user_str
            ORDER BY $sort
            LIMIT $startAt, $perPage
        "));

        $response = [
            'status' => 'success',
            'comments' => $comments,
            'perPage' => $perPage,
            'page' => $page,
            'startAt' => $startAt,
            'totalPages' => $totalPages,
            'total' => $count['total'],
        ];

        return response($response, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $fields = $request->validate([
            'site_link' => ['required', 'string', 'max:255'],
            'site_name' => ['required', 'string', 'max:255'],
            'rating' => ['required', 'numeric', 'min:1', 'max:5'],
            'title' => ['required', 'string', 'max:255'],
            'content' => ['required', 'string', 'min:5'],
        ]);

        $user = $request->user();

        $comment = Comment::create([
            'site_link' => $fields['site_link'],
            'site_name' => $fields['site_name'],
            'rating' => $fields['rating'],
            'title' => $fields['title'],
            'content' => $fields['content'],
            'user_id' => $user->id
        ]);

        $response = [
            'status' => 'success',
            'message' => 'The comment has been created successfully!',
            'comment' => $comment
        ];

        return response($response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $comment = Comment::join('users', 'comments.user_id', '=', 'users.id')
                    ->select('comments.*', 'users.name as userName', 'users.picture as userPicture')
                    ->where('comments.id', $id)
                    ->first();

        if(!isset($comment)) {
            return response()->json(['message' => 'Not Found'], 404);
        }
        return response([
            'status' => 'success',
            'comment' => $comment
        ], 200);
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
        $comment = Comment::where('id', $id)
                            ->first();

        if(!isset($comment)) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        $user = $request->user();
        if($user->id !== $comment->user_id && $user->role !== 'admin') {
            return response()->json(['message' => 'You are not allowed to do that!'], 403);
        }

        $fields = $request->validate([
            'site_link' => ['required', 'string', 'max:255'],
            'site_name' => ['required', 'string', 'max:255'],
            'rating' => ['required', 'numeric', 'min:1', 'max:5'],
            'title' => ['required', 'string', 'max:255'],
            'content' => ['required', 'string', 'min:5'],
        ]);
        // https://stackoverflow.com/a/62099533
        $comment = tap(Comment::where('id', $id))
                    ->update([
                        'site_link' => $fields['site_link'],
                        'site_name' => $fields['site_name'],
                        'rating' => $fields['rating'],
                        'title' => $fields['title'],
                        'content' => $fields['content'],
                    ])
                    ->first();
        $response = [
            'status' => 'success',
            'message' => 'The comment has been updated successfully!',
            'comment' => $comment
        ];
        return response($response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        $comment = Comment::where('id', $id)
                            ->first();

        if(!isset($comment)) {
            return response()->json(['message' => 'Not Found'], 404);
        }

        $user = $request->user();
        if($user->id !== $comment->user_id && $user->role !== 'admin') {
            return response()->json(['message' => 'You are not allowed to do that!'], 403);
        }

        Comment::where('id', $id)->delete();
        $response = [
            'status' => 'success',
            'message' => 'The comment has been deleted successfully!'
        ];
        return response($response, 200);
    }

    /*
        https://stackoverflow.com/a/5147007
        https://stackoverflow.com/a/41887524   the max is used here to kinda sort
    */
    public function search(Request $request)
    {
        // Get params
        $site = $request->query('site', '') ?? '';
        $stars = $request->query('stars', '') ?? ''; // stars is min stars here
        $sort = $request->query('sort', 'max_id desc') ?? 'max_id desc';

        $stars_str = trim($stars) === "" ? "" : "HAVING rating_avg >= $stars";

        // Count query
        $countStdClass = DB::select(DB::raw("
        Select Count(*) as total
        From (
            SELECT site_link, site_name, count(*) as comments_total, AVG(rating) AS rating_avg, MAX(id) AS max_id
            FROM comments
            WHERE
                (site_link LIKE \"%$site%\" OR site_name LIKE \"%$site%\")
            GROUP BY site_link, site_name
            $stars_str
            ORDER BY $sort
            ) As Z
        "));
        $count = (array) $countStdClass[0];

        // $startAt; $perPage; $title; $category; $sort; $min_price; $max_price;
        $perPage = $request->query('per_page', '10') ?? '10';
        $page = $request->query('page', 1) ?? 1;
        $startAt = $perPage * ($page - 1);
        $totalPages = ceil($count['total'] / ($perPage == 0 ? 10 : $perPage));

        $comments = DB::select(DB::raw("
            SELECT site_link, site_name, count(*) as comments_total, AVG(rating) AS rating_avg, MAX(id) AS max_id
            FROM comments
            WHERE
                (site_link LIKE \"%$site%\" OR site_name LIKE \"%$site%\")
            GROUP BY site_link, site_name
            $stars_str
            ORDER BY $sort
            LIMIT $startAt, $perPage
        "));

        $response = [
            'status' => 'success',
            'comments' => $comments,
            'perPage' => $perPage,
            'page' => $page,
            'startAt' => $startAt,
            'totalPages' => $totalPages,
            'total' => $count['total'],
        ];

        return response($response, 200);
    }
}
