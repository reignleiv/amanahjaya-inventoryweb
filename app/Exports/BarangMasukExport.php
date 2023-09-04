<?php

namespace App\Exports;

use App\Models\Admin\BarangmasukModel;
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
    public function __construct($tglawal, $tglakhir)
    {
        $this->tglawal = $tglawal;
        $this->tglakhir = $tglakhir;
    }
    public function headings(): array
    {
        return ["Id", "Kode Barang Masuk", "Kode Barang", "Supplier", "Tanggal Masuk", "Jumlah Barang Masuk", "Density", "Nomor Polisi", "Nomor Surat Jalan", "Jumlah Masuk Actual"];
    }
    public function query()
    {
        return BarangmasukModel::query();
    }
}
