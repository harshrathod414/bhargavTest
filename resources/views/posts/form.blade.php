@extends('layouts.app')
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="ml-2"> @if(isset($post))
                    {{ __('Edit post') }}
                    @else
                    {{ __('Create post') }}
                    @endif
                </h1>
                <div class="back-btn bredcrumb">
                    <a href="{{route('posts.index')}}">Posts</a><i class="fas fa-chevron-right"></i><a href="#">  
                        @if(isset($post)) 
                        {{ __('Edit post') }}
                        @else
                        {{ __('Create post') }}
                        @endif</a>
                </div>
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
                <div class="col-md-12">
                    <form method="POST" action="{{ route('posts.store') }}" id="posts" enctype="multipart/form-data">
                        @csrf
                        <input id="edit_id" type="hidden" class="form-control" name="edit_id" @if(isset($post)) value="{{ $post->id }}" @else value='' @endif>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>
                                            @if(isset($post))
                                            {{ __('Edit post') }}
                                            @else
                                            {{ __('Create post') }}
                                            @endif
                                        </strong>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group col-md-12">
                                            <label for="title" class="col-form-label text-md-right">
                                                {{ __('Title') }} <span class="mandatory_fields">*</span>
                                            </label>
                                            <div class="">
                                                <input id="title" type="text" class="form-control" name="title" autofocus value="@if( isset( $post ) ){{ $post->title }}@else{{ old('title') }}@endif" placeholder="Enter post title" @if(!isset($post))  @endif>
                                                @if ($errors->has('title'))
                                                <span class="text-danger">{{ $errors->first('title') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="body" class="col-form-label text-md-right">
                                                {{ __('Post Body') }} <span class="mandatory_fields">*</span>
                                            </label>
                                            <div class="">
                                                <textarea id="body" class="form-control" name="body">
                                                    @if( isset( $post ) ){{ $post->body }}@else{{ old('body') }}@endif
                                                </textarea>
                                                @if ($errors->has('body'))
                                                <span class="text-danger">{{ $errors->first('body') }}</span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                        <label for="blog_image" class="col-form-label text-md-right">
                                            {{ __('Post Image') }}<span class="mandatory_fields">*</span>
                                        </label>
                                        <input type="file" name="files[]" id="files" multiple>
                                        @if ($errors->has('files'))
                                        <span class="text-danger">{{ $errors->first('files') }}</span>
                                        @endif
                                        </div>
                                        <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary mx-1" id="submitBtn"> {{ __('Save') }} </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content -->
@endsection