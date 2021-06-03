<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    protected $table = 'branch';

   	protected $fillable = [
       'customer_id','branch_name', 'address_1', 'address_2', 'address_3', 'postcode'];
}
