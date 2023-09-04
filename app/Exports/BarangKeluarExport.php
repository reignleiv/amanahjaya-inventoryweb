<?php

namespace App\Exports;

use App\Models\Admin\BarangkeluarModel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Support\Facades\DB;   

class BarangKeluarExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return BarangkeluarModel::all();
    }
    public function headings(): array
    {
        return ["Id", "Kode Barang Keluar", "Kode Barang", "Tanggal Keluar", "Tujuan", "Jumlah Barang Keluar", "Density", "Nomor Polisi", "Nomor Surat Jalan", "Jumlah Keluar Actual"];
    }
}
