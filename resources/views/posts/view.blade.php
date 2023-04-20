@extends('layouts.app')

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="ml-2">{{ __('Post View') }}</h1>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
    @if (\Session::has('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {!! \Session::get('success') !!}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    @if (\Session::has('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {!! \Session::get('error') !!}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="container mt-4">
                    <div class="card">
                        <div class="card-header">
                            {{ __('Post View') }}
                        </div>
                        <div class="card-body">
                            <strong>Title:</strong>
                            <p class="card-text">{{$post->title}}.</p>

                            <strong>Body:</strong>
                            <p class="card-text">{{$post->body}}</p>
                            <hr>
                            <h5><strong>Add Comment</strong></h5>
                            <form method="POST" action="{{ route('comments.store') }}" id="comments" enctype="multipart/form-data">
                                @csrf
                                <div class="form-group row">
                                    <input type="hidden" value="{{$post->id}}" name="post_id">
                                    <label for="body" class="col-sm-2 col-form-label">Comment</label>
                                    <div class="col-sm-10">
                                        <input type="text" required class="form-control" name="body" id="body" placeholder="please add comment here">
                                    </div>
                                    @if ($errors->has('body'))
                                    <span class="text-danger">{{ $errors->first('body') }}</span>
                                    @endif
                                </div>
                                <div class="form-group row"><label for="image" class="col-sm-2 col-form-label">Image</label>
                                    <div class="col-sm-10"><input type="file" class="form-control-file" name="file" id="file">
                                    </div>
                                    @if ($errors->has('file'))
                                    <span class="text-danger">{{ $errors->first('file') }}</span>
                                    @endif
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12"><button type="submit" class="btn btn-success">Add</button></div>
                                </div>
                            </form>
                            <h5><strong>Comments</strong></h5>
                            <ul class="list-unstyled tableData">
                                <!-- main comment section -->
                                @foreach ($post->comments as $comment)
                                <hr>
                                <div class="comment">
                                    <div class="comment-header">
                                        @if($comment->image!="")
                                        <img src="{{url('/')}}/uploads/comments/{{ $comment->image }}" width="50" height="50" alt="Profile Picture">
                                        @else
                                        <img src="{{url('/')}}/uploads/no-image.jpg" width="50" height="50" alt="Profile Picture">
                                        @endif
                                        <h4 class="text-secondary">{{ $comment->user->first_name }}</h4>
                                        <span>{{ $comment->created_at->diffForHumans() }}</span>
                                    </div>
                                    <div class="comment-body">
                                        <p>{{ $comment->body }}</p>
                                    </div>
                                    <div class="comment-footer">
                                        <button class="btn btn-sm btn-primary reply-btn" data-id="{{$comment->id}}">Reply</button>
                                        <button class="btn btn-sm btn-danger delete-comment" data-id="{{$comment->id}}">Delete</button>
                                    </div>

                                    <!-- recursive call to display nested comments -->
                                    @php $style = 'margin-left: 30px;'; @endphp
                                    @include('posts.child', ['comments' => $comment->replies, 'style'=>$style])
                                </div>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content -->

<!-- Modal HTML -->
<div id="myModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="{{ route('comments.store') }}" id="comments" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">Reply Comment</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    @csrf
                    <div class="form-group row">
                        <input type="hidden" id="modelCommentID" value="" name="parent_id">
                        <label for="body" class="col-sm-2 col-form-label">Comment</label>
                        <div class="col-sm-10">
                            <input type="text" required class="form-control" name="body" id="body" placeholder="please add comment here">
                        </div>
                        @if ($errors->has('body'))
                        <span class="text-danger">{{ $errors->first('body') }}</span>
                        @endif
                    </div>
                    <div class="form-group row"><label for="image" class="col-sm-2 col-form-label">Image</label>
                        <div class="col-sm-10"><input type="file" class="form-control-file" name="file" id="file">
                        </div>
                        @if ($errors->has('file'))
                        <span class="text-danger">{{ $errors->first('file') }}</span>
                        @endif
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
@section('scripts')
<script>
    $(document).ready(function() {
        $("#edit_id").val("");
        $(".edit-post").click(function() {
            var post_id = $(this).data('id');
            $.ajax({
                url: "{{ url('/') }}/posts/" + post_id + "/edit",
                method: "GET",
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                },
                success: function(response) {
                    if (response) {
                        var post = response;
                        $(".add-edit").html("Edit post");
                        $("#edit_id").val(post.id);
                        $("#title").val(post.name);
                        $("#body").val(post.description);
                    }
                }
            });
        })

        $('body').on('click', '.delete-comment', function(e) {
            e.preventDefault();
            if (confirm("Are you sure you want to delete this?")) {
                var comment_id = $(this).data('id');

                $.ajax({
                    url: "{{ url('/') }}/comments/" + comment_id,
                    method: "DELETE",
                    headers: {
                        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function(response) {
                        toastr.success("Comment Deleted Successfully");
                        $(".tableData").load(document.URL + " .tableData");
                    }
                });
            }
        });
    });


    $('body').on('click', '.reply-btn', function(e) {
        var comment_id = $(this).data('id');
        $("#modelCommentID").val(comment_id);
        $("#myModal").modal('show');

    });
</script>

@endsection