<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerModel extends Model
{
    use HasFactory;
    protected $table = "tbl_supplier";
    protected $primaryKey = 'customer_id';
    protected $fillable = [
        'customer_nama',
        'customer_slug',
        'customer_alamat',
        'customer_notelp',
    ];
}
