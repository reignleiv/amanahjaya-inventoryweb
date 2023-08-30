<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangmasukModel extends Model
{
    use HasFactory;
    protected $table = "tbl_barangmasuk";
    protected $primaryKey = 'bm_id';
    protected $fillable = [
        'bm_kode',
        'barang_kode',
        'customer_id',
        'bm_tanggal',
        'bm_jumlah',
        'bm_density',
        'bm_no_polisi',
        'bm_surat_jalan',
        'bm_jumlah_masuk_actual'
    ];
}
