<?php

namespace App\Exports;

use App\Models\Admin\BarangmasukModel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Illuminate\Support\Facades\DB;

class BarangMasukExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */

    public function collection()
    {
        return BarangmasukModel::all();
    }
    public function headings(): array
    {
        return ["Id", "Kode Barang Masuk", "Kode Barang", "Supplier", "Tanggal Masuk", "Jumlah Barang Masuk", "Density", "Nomor Polisi", "Nomor Surat Jalan", "Jumlah Masuk Actual"];
    }
}
