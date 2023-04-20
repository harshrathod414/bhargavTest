<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $comment = new Comment;
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $extension = $file->getClientOriginalExtension();
            $filename = "comment-image-" . time() . '.' . $extension;
            $file->move(public_path('uploads/comments/'), $filename);
            $comment->image = $filename;
        }
        $comment->body = $request->input('body');
        $comment->user_id = Auth::id();
        $comment->post_id = $request->post_id;

        $comment->parent_id = NULL;
        if ($request->parent_id && $request->parent_id != "") {
            $comment->parent_id = $request->parent_id;
        }
        $comment->save();
        return redirect()->back()->with("success", "Comment created successfully."); //, '');

    }
    /**
     * Display the specified resource.
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $comment = Comment::where("id", $id)->first();
        if ($comment->image != "") {
            unlink(public_path('uploads/comments/' . $comment->image));
        }
        $comment->delete();
    }
}
