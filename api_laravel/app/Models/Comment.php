<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = [
        'site_link',
        'site_name',
        'rating',
        'title',
        'content',
        'user_id'
    ];
}
