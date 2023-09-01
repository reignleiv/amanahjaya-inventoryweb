<?php

namespace App\Exports;

use App\Models\Admin\BarangmasukModel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class BarangMasukExport implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return BarangmasukModel::all();
    }
}
