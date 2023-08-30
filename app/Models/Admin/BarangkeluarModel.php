<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangkeluarModel extends Model
{
    use HasFactory;
    protected $table = "tbl_barangkeluar";
    protected $primaryKey = 'bk_id';
    protected $fillable = [
        'bk_kode',
        'barang_kode',
        'bk_tanggal',
        'bk_tujuan',
        'bk_jumlah',
        'bk_density',
        'bk_no_polisi',
        'bk_surat_jalan',
        'bk_jumlah_keluar_actual'
    ]; 
}
