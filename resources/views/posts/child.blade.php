@foreach ($comments as $comment)
<div class="comment mt-2" style="{{$style}}">
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
    @include('posts.child', ['comments' => $comment->replies,'style'=>$style])
</div>
@endforeach