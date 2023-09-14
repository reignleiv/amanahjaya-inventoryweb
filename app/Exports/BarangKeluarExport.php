<?php

namespace App\Exports;

use App\Models\Admin\BarangkeluarModel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Carbon\Carbon;
use Maatwebsite\Excel\Events\AfterSheet;

class BarangKeluarExport implements FromQuery, WithHeadings, ShouldAutoSize
{
    /**
     * @return \Illuminate\Support\Collection
     */
    use Exportable;

    protected $tglawal;
    protected $tglakhir;

    public function __construct($tglawal, $tglakhir)
    {
        $this->tglawal = $tglawal;
        $this->tglakhir = $tglakhir;
    }
    public function headings(): array
    {
        return ["Id", "Kode Barang Keluar", "Nama Barang", "Tanggal Keluar", "Jumlah Barang Keluar", "Density", "Jumlah Keluar Actual"];
    }
    public function query()
    {
        if (is_null($this->tglawal) || is_null($this->tglakhir)) {
            return BarangkeluarModel::query()->select(
                'tbl_barangkeluar.bk_id',
                'tbl_barangkeluar.barang_kode',
                'tbl_barang.barang_nama',
                'tbl_barangkeluar.bk_tanggal',
                'tbl_barangkeluar.bk_jumlah',
                'tbl_barangkeluar.bk_density',
                'tbl_barangkeluar.bk_jumlah_keluar_actual'
            )
            ->leftjoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode');
        } else {
            return BarangkeluarModel::query()->select(
                'tbl_barangkeluar.bk_id',
                'tbl_barangkeluar.barang_kode',
                'tbl_barang.barang_nama', 
                'tbl_barangkeluar.bk_tanggal',
                'tbl_barangkeluar.bk_jumlah',
                'tbl_barangkeluar.bk_density',
                'tbl_barangkeluar.bk_jumlah_masuk_actual'
            )
            ->whereBetween('bk_tanggal', [$this->tglawal, $this->tglakhir])->leftjoin('tbl_barang', 'tbl_barang.barang_kode', 
            '=', 'tbl_barangkeluar.barang_kode');
            
            if (!is_null($this->bk_id)) {
                $query->where('tbl_barangkeluar.barang_kode', $this->bk_id);
            }
        }
    }
}
