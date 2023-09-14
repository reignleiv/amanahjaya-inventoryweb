<?php

namespace App\Exports;

use App\Models\Admin\BarangmasukModel;
use App\Models\Admin\BarangModel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Carbon\Carbon;
use Maatwebsite\Excel\Events\AfterSheet;

class BarangMasukExport implements FromQuery, WithHeadings, ShouldAutoSize
{
    /**
     * @return \Illuminate\Support\Collection
     */
    use Exportable;

    protected $tglawal;
    protected $tglakhir;
    protected $bm_id; 
    

    public function __construct($tglawal, $tglakhir,$bm_id)
    {
        $this->tglawal = $tglawal;
        $this->tglakhir = $tglakhir;
        $this->bm_id = $bm_id;
    }
    public function headings(): array
    {
        return ["Id", "Kode Barang Masuk", "Nama Barang", "Nama Supplier", "Tanggal Masuk", "Jam Masuk", "Jumlah Barang Masuk", "Density", "Jumlah Masuk Actual", "Nomor Polisi", "Nomor Surat Jalan", "Keterangan"];
    }
    public function query()
    {
        if (is_null($this->tglawal) || is_null($this->tglakhir)) {
            return BarangmasukModel::query()->select(
                'tbl_barangmasuk.bm_id',
                'tbl_barangmasuk.barang_kode',
                'tbl_barang.barang_nama',
                'tbl_supplier.customer_nama',
                'tbl_barangmasuk.bm_tanggal',
                'tbl_barangmasuk.jam_masuk',
                'tbl_barangmasuk.bm_jumlah',
                'tbl_barangmasuk.bm_density',
                'tbl_barangmasuk.bm_jumlah_masuk_actual',
                'tbl_barangmasuk.bm_no_polisi',
                'tbl_barangmasuk.bm_surat_jalan',
                'tbl_barangmasuk.keterangan'
                
            )
            ->leftjoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
            ->leftjoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id');
        } else {
            return BarangmasukModel::query()->select(
                'tbl_barangmasuk.bm_id',
                'tbl_barangmasuk.barang_kode',
                'tbl_barang.barang_nama', 
                'tbl_supplier.customer_nama',
                'tbl_barangmasuk.bm_tanggal',
                'tbl_barangmasuk.jam_masuk',
                'tbl_barangmasuk.bm_jumlah',
                'tbl_barangmasuk.bm_density',
                'tbl_barangmasuk.bm_jumlah_masuk_actual',
                'tbl_barangmasuk.bm_no_polisi',
                'tbl_barangmasuk.bm_surat_jalan',
                'tbl_barangmasuk.keterangan'
                
            )
            ->whereBetween('bm_tanggal', [$this->tglawal, $this->tglakhir])->leftjoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
            ->leftjoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id');

            if (!is_null($this->bm_id)) {
                $query->where('tbl_barangmasuk.barang_kode', $this->bm_id);
            }
        }
    }
}
