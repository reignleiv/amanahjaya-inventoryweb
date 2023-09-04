<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\BarangkeluarModel;
use App\Models\Admin\WebModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Models\Admin\SatuanModel;
use App\Exports\BarangKeluarExport;
use PDF;
use Excel;

class LapBarangKeluarController extends Controller
{
    public function index()
    {
        $data["title"] = "Lap Barang Keluar";
        $data["satuan"] =  SatuanModel::orderBy('satuan_id', 'DESC')->get();
        return view('Admin.Laporan.BarangKeluar.index', $data);
    }

    public function print(Request $request)
    {
        if ($request->tglawal) {
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->whereBetween('bk_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bk_id', 'DESC')->get();
        } else {
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->orderBy('bk_id', 'DESC')->get();
        }

        $data["title"] = "Print Barang Keluar";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;
        return view('Admin.Laporan.BarangKeluar.print', $data);
    }

    public function pdf(Request $request)
    {
        if ($request->tglawal) {
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->whereBetween('bk_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bk_id', 'DESC')->get();
        } else {
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->orderBy('bk_id', 'DESC')->get();
        }

        $data["title"] = "PDF Barang Keluar";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;
        $pdf = PDF::loadView('Admin.Laporan.BarangKeluar.pdf', $data);

        if ($request->tglawal) {
            return $pdf->download('lap-bk-' . $request->tglawal . '-' . $request->tglakhir . '.pdf');
        } else {
            return $pdf->download('lap-bk-semua-tanggal.pdf');
        }
    }
    public function excel(Request $request)
    {
        // Check if both start and end dates are provided in the request
        if ($request->tglawal && $request->tglakhir) {
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                ->whereBetween('bk_tanggal', [$request->tglawal, $request->tglakhir])
                ->orderBy('bk_id', 'DESC')
                ->get();

            // Define a file name based on date range
            $fileName = 'lap-bm-' . $request->tglawal . '-' . $request->tglakhir . '.xlsx';
        } else {
            // If no date range is specified, export all data
            $data['data'] = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                ->orderBy('bk_id', 'DESC')
                ->get();

            // Define a file name for all dates
            $fileName = 'lap-bk-semua-tanggal.xlsx';
        }

        $data["title"] = "Excel Barang Keluar";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;

        // Use the defined file name for Excel export
        return Excel::download(new BarangKeluarExport($data['data']), $fileName);
    }
    public function show(Request $request)
    {
        if ($request->ajax()) {
            if ($request->tglawal == '') {
                $data = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->orderBy('bk_id', 'DESC')->get();
            } else {
                $data = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_baran`g.barang_kode', '=', 'tbl_barangkeluar.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->whereBetween('bk_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bk_id', 'DESC')->get();
            }
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('tgl', function ($row) {
                    $tgl = $row->bk_tanggal == '' ? '-' : Carbon::parse($row->bk_tanggal)->translatedFormat('d F Y');

                    return $tgl;
                })

                ->addColumn('barang', function ($row) {
                    $barang = $row->barang_id == '' ? '-' : $row->barang_nama;

                    return $barang;
                })
                ->addColumn('satuan', function ($row) {
                    $satuan = $row->satuan_id == '' ? '-' : $row->satuan_nama;

                    return $satuan;
                })

                ->rawColumns(['tgl', 'barang', 'satuan'])->make(true);
        }
    }
}
