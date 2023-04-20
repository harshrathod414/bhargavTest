<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;


class Post extends Model
{
    use HasFactory,Sortable;

    public function images(){
        return $this->hasMany(PostImage::class);
    }

    public function comments(){
        return $this->hasMany(Comment::class);
    }
}
