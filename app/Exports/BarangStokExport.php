<?php

namespace App\Exports;

use App\Models\Admin\BarangkeluarModel;
use App\Models\Admin\BarangmasukModel;
use App\Models\Admin\BarangModel;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class BarangStokExport implements FromQuery, ShouldAutoSize, WithHeadings, WithMapping
{
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
        return [
            'Kode Barang',
            'Nama Barang',
            'Stok Awal/ Stok Fisik',
            'Material Masuk',
            'Material Keluar',
            'Balance/ Stok Buku',
            'Loss/ Gain',
        ];
    }

    public function query()
    {
        $tglawal = request()->tglawal;
        $tglakhir = request()->tglakhir;

        $query = BarangModel::leftJoin('tbl_jenisbarang', 'tbl_jenisbarang.jenisbarang_id', '=', 'tbl_barang.jenisbarang_id')
            ->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')
            ->leftJoin('tbl_merk', 'tbl_merk.merk_id', '=', 'tbl_barang.merk_id')
            ->orderBy('tbl_barang.barang_id', 'DESC');

        if ($tglawal && $tglakhir) {
            $query->whereBetween('tbl_barang.created_at', [$tglawal, $tglakhir]);
        }

        return $query;
    }


    public function map($data): array
    {
        $tglawal = $this->tglawal; // Access the property value
        $tglakhir = $this->tglakhir;

        if ($tglawal == '') {
            $jmlmasuk = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
                ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
                ->where('tbl_barangmasuk.barang_kode', '=', $data->barang_kode)
                ->sum('tbl_barangmasuk.bm_jumlah');
        } else {
            $jmlmasuk = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
                ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
                ->where('tbl_barangmasuk.barang_kode', '=', $data->barang_kode)
                ->whereBetween('bm_tanggal', [$tglawal, $tglakhir])
                ->sum('tbl_barangmasuk.bm_jumlah');
        }

        if ($tglawal != '') {
            $jmlkeluar = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                ->whereBetween('bk_tanggal', [$tglawal, $tglakhir])
                ->where('tbl_barangkeluar.barang_kode', '=', $data->barang_kode)
                ->sum('tbl_barangkeluar.bk_jumlah');
        } else {
            $jmlkeluar = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                ->where('tbl_barangkeluar.barang_kode', '=', $data->barang_kode)
                ->sum('tbl_barangkeluar.bk_jumlah');
        }

        $totalstok = $data->barang_stok + ($jmlmasuk - $jmlkeluar);

        $lossgain = $data->barang_stok - $totalstok;

        return [
            $data->barang_kode,
            $data->barang_nama,
            $data->barang_stok . ' ' . $data->satuan_nama,
            $jmlmasuk . ' ' . $data->satuan_nama,
            $jmlkeluar . ' ' . $data->satuan_nama,
            $totalstok . ' ' . $data->satuan_nama,
            $lossgain . ' ' . $data->satuan_nama
        ];
    }
}
