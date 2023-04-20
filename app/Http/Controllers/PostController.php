<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\PostImage;

class PostController extends Controller
{
    public function index(Request $request)
    {
        $posts = Post::with("images", "comments")->sortable();
        $search = $request->search;
        if ($search && $search != "") {
            $posts = $posts->where(function ($query) use ($search) {
                $query->where('title', 'like', '%' . $search . '%')->orWhere('price', 'like', '%' . $search . '%');
            });
        }
        $posts = $posts->paginate(10);
        return view('posts.index', compact('posts'));
    }

    public function create()
    {
        return view('posts.form');
    }

    public function store(Request $request)
    {

        $request->validate([
            'title' => 'required|min:20|max:255',
            'body' => 'required',
            'files.*' => 'nullable|file|mimetypes:image/jpeg,image/png,image/gif,video/mp4,video/avi,video/mpeg|max:20000' // Max size of 20MB
        ]);
        if ($request->edit_id && $request->edit_id != "") {
            $checkExist = Post::where("title", $request->title)->where("id", "!=", $request->edit_id)->first();
            $post =  Post::where("id", $request->edit_id)->first();
        } else {
            $checkExist = Post::where("title", $request->title)->first();
            $post = new Post;
        }
        if ($checkExist) {
            return redirect()->back()->with("error", "Post already exists!"); //, '');
        }
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->user_id = Auth::id();
        $post->save();

        if ($request->hasFile('files')) {
            foreach ($request->file('files') as $file) {
                $extension = $file->getClientOriginalExtension();
                $filename = "post-image-" . time() . '.' . $extension;
                $file->move(public_path('uploads/posts/'), $filename);
                $postImage = new PostImage;
                $postImage->image = $filename;
                $postImage->post_id = $post->id;
                $postImage->save();
            }
        }
        if ($request->edit_id && $request->edit_id != "") {
            return redirect()->back()->with("success", "Post updated successfully."); //, '');
        } else {
            return redirect()->back()->with("success", "Post created successfully."); //, '');
        }
    }
    public function bulkAction(Request $request)
    {
        $selectedIds =  $request->selectedIds;
        $action = $request->action;
        if ($action == "delete") {
            Post::whereIn("id", $selectedIds)->delete();
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        post::where("id", $id)->delete();
    }

    public function edit($id)
    {
        $post = Post::where("id", $id)->first();
        return view('posts.form', compact("post"));
    }
    public function show($id)
    {
        $post = Post::with([
            "comments" => function ($query) {
                $query->whereNull('parent_id');
            },
            "comments.user",
            "comments.replies",
            "images"
        ])->where("id", $id)->first();
        return view('posts.view', compact("post"));
    }
}
