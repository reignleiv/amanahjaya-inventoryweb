<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\BarangmasukModel;
use App\Models\Admin\WebModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Exports\BarangMasukExport;

use Excel;
use PDF;

class LapBarangMasukController extends Controller
{
    public function index(Request $request)
    {
        $data["title"] = "Lap Barang Masuk";
        return view('Admin.Laporan.BarangMasuk.index', $data);
    }

    public function print(Request $request)
    {
        if ($request->tglawal) {
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->whereBetween('bm_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bm_id', 'DESC')->get();
        } else {
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->orderBy('bm_id', 'DESC')->get();
        }

        $data["title"] = "Print Barang Masuk";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;
        return view('Admin.Laporan.BarangMasuk.print', $data);
    }

    public function pdf(Request $request)
    {
        if ($request->tglawal) {
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->whereBetween('bm_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bm_id', 'DESC')->get();
        } else {
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->orderBy('bm_id', 'DESC')->get();
        }

        $data["title"] = "PDF Barang Masuk";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;
        $pdf = PDF::loadView('Admin.Laporan.BarangMasuk.pdf', $data);

        if ($request->tglawal) {
            return $pdf->download('lap-bm-' . $request->tglawal . '-' . $request->tglakhir . '.pdf');
        } else {
            return $pdf->download('lap-bm-semua-tanggal.pdf');
        }
    }
    //Function untuk excel
    public function excel(Request $request)
    {
        // Check if both start and end dates are provided in the request
        if ($request->tglawal && $request->tglakhir) {
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
            ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
            ->whereBetween('bm_tanggal', [$request->tglawal, $request->tglakhir])
                ->orderBy('bm_id', 'DESC')
                ->get();

            // Define a file name based on date range
            $fileName = 'lap-bm-' . $request->tglawal . '-' . $request->tglakhir . '.xlsx';
        } else {
            // If no date range is specified, export all data
            $data['data'] = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
            ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
            ->orderBy('bm_id', 'DESC')
            ->get();

            // Define a file name for all dates
            $fileName = 'lap-bm-semua-tanggal.xlsx';
        }

        $data["title"] = "Excel Barang Masuk";
        $data['web'] = WebModel::first();
        $data['tglawal'] = $request->tglawal;
        $data['tglakhir'] = $request->tglakhir;

        // Use the defined file name for Excel export
        return Excel::download(new BarangMasukExport($data['data']), $fileName);
    }

    //end

    public function show(Request $request)
    {
        if ($request->ajax()) {
            if ($request->tglawal == '') {
                $data = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->orderBy('bm_id', 'DESC')->get();
            } else {
                $data = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->whereBetween('bm_tanggal', [$request->tglawal, $request->tglakhir])->orderBy('bm_id', 'DESC')->get();
            }
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('tgl', function ($row) {
                    $tgl = $row->bm_tanggal == '' ? '-' : Carbon::parse($row->bm_tanggal)->translatedFormat('d F Y');

                    return $tgl;
                })
                ->addColumn('customer', function ($row) {
                    $customer = $row->customer_id == '' ? '-' : $row->customer_nama;

                    return $customer;
                })
                ->addColumn('barang', function ($row) {
                    $barang = $row->barang_id == '' ? '-' : $row->barang_nama;

                    return $barang;
                })
                ->addColumn('satuan', function ($row) {
                    $satuan = $row->satuan_id == '' ? '-' : $row->satuan_nama;

                    return $satuan;
                })


                ->rawColumns(['tgl', 'customer', 'barang', 'satuan'])->make(true);
        }
    }
}
