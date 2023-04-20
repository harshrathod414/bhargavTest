@extends('layouts.app')
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="ml-2">{{ __('Users') }}</h1>
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
                        <!-- {{ __('users') }} -->
                        <div class="justify-content-between">
                            <div>
                                {{ __('Users') }}
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <table class="table tableData tableData">
                            <thead>
                                <tr>
                                    <td><input type="checkbox" id="selectall" class="css-checkbox " name="selectall"></td>
                                    <td>@sortablelink("name")</td>
                                    <td>@sortablelink("email")</td>
                                    <td>@sortablelink("created_at","Created Date")</td>
                                    <td>@sortablelink("updated_at","Updated Date")</td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $user)
                                <tr>
                                    <td><input type="checkbox" class="checkboxall" id="{{$user->id}}"></td>
                                    <td>{{ $user->first_name }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td>{{ getFormatDate($user->created_at) }}</td>
                                    <td>{{ getFormatDate($user->updated_at) }}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                    <div class="d-flex justify-content-end">
                        {{ $users->links() }}
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
