<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $users = User::sortable()->paginate(10);
        return view('users.index', compact('users'));
    }
}
