<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Post;
class Postpolicy
{
    use HandlesAuthorization;
    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function update(User $user,Post $post){
        return $user->id == $post->user_id;
    }

    public function delete(User $user,Post $post){
        return $user->id == $post->user_id;
    }
}
