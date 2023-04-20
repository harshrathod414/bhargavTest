    @extends('layouts.app')

    @section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="ml-2">{{ __('Posts') }}</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-header">
                            <!-- {{ __('posts') }} -->
                            <div class="justify-content-between">
                                <div>
                                    {{ __('posts') }}
                                </div>
                                <div class="d-flex align-items-center mt-2 justify-content-between">
                                    <form class="d-flex align-items-center col-md-5 px-0" action="{{route('posts.index',)}}" method="get">
                                        <input name="search" value="{{ request()->input('search')}}" size="50" id="search" class="form-control ml-2" placeholder="Search post">
                                        <button id="seachBtnAction" type="submit" class="btn btn-sm ml-2">Search</button>
                                        <a href="{{route('posts.index')}}" class="ml-2" title="Reset Search"><i class='fa fa-refresh'></i></a>
                                    </form>
                                    <div class="col-md-5 d-flex">
                                        <select name="bulk_action_input" id="bulk_action_input" class="form-control ml-2 ">
                                            <option value="">Bulk Action</option>
                                            <option value="delete">Delete</option>
                                        </select>
                                        <button name="bulkBtnAction" id="bulkBtnAction" class="btn btn-sm ml-2">Apply</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">

                            <table class="table tableData">
                                <thead>
                                    <tr>
                                        <td><input type="checkbox" id="selectall" class="css-checkbox " name="selectall"></td>
                                        <td>@sortablelink("title")</td>
                                        <td>@sortablelink("body")</td>
                                        <td>@sortablelink("created_at","Created Date")</td>
                                        <td>@sortablelink("updated_at","Updated Date")</td>
                                        <td>Action</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($posts as $post)
                                    <tr>
                                        <td><input type="checkbox" class="checkboxall" id="{{$post->id}}"></td>
                                        <td>{{ $post->title }}</td>
                                        <td>{{ $post->body }}</td>
                                        <td>{{ getFormatDate($post->created_at) }}</td>
                                        <td>{{ getFormatDate($post->updated_at) }}</td>
                                        <td>
                                            <a href="{{route('posts.show',$post->id)}}" class="view-post text-warning" data-id="{{$post->id}}" title="View"><i class="fa-solid fa-eye"></i></a>
                                            <a href="{{route('posts.edit',$post->id)}}" class="edit-post text-primary" data-id="{{$post->id}}" title="Edit"><i class="fa-solid fa-pen-to-square"></i></a>
                                            <a href="javascript:void(0)" class="delete-post text-danger" data-id="{{$post->id}}" title="Delete"><i class="fa-solid fa-trash"></i></a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer clearfix">
                            <div class="d-flex justify-content-end">
                                {{ $posts->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
    @endsection
    @section('scripts')
    <script>
        $(document).ready(function() {
            $('body').on('click', '.delete-post', function(e) {
                e.preventDefault();
                if (confirm("Are you sure you want to delete this post?")) {
                    var post_id = $(this).data('id');
                    $.ajax({
                        url: "{{ url('/') }}/posts/" + post_id,
                        method: "DELETE",
                        headers: {
                            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                        },
                        success: function(response) {
                            toastr.success("post Deleted Successfully");
                            $(".tableData").load(document.URL + " .tableData");
                        }
                    });
                }
            });
        });
        // bulk action start
        $('#bulkBtnAction').click(function() {
            var array = $('tbody input:checked');
            var action = $('#bulk_action_input').val();
            var selectedIds = [];
            $.each(array, function(idx, obj) {
                selectedIds.push($(obj).attr('id'));
            });
            console.log(selectedIds);
            if (selectedIds.length == 0) {
                alert("please select post")
                return
            }
            if (action == "") {
                alert("please select action")
                return
            }
            $.ajax({
                url: "{{ route('posts.bulk_action') }}",
                method: "POST",
                data: {
                    "selectedIds": selectedIds,
                    "action": action,
                },
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                },
                success: function(response) {
                    toastr.success("posts Deleted Successfully");
                    $(".tableData").load(document.URL + " .tableData");
                }
            });
        });
        // bulk action end
    </script>

    @endsection