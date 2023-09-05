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
        return ["Id", "Kode Barang Keluar", "Kode Barang", "Tanggal Keluar", "Tujuan", "Jumlah Barang Keluar", "Density", "Nomor Polisi", "Nomor Surat Jalan", "Jumlah Keluar Actual"];
    }
    public function query()
    {
        if (is_null($this->tglawal) || is_null($this->tglakhir)) {
            return BarangkeluarModel::query();
        } else {
            return BarangkeluarModel::query()->whereBetween('bk_tanggal', [$this->tglawal, $this->tglakhir]);
        }
    }
}
