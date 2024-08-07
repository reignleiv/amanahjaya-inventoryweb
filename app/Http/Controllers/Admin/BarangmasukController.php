<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\AksesModel;
use App\Models\Admin\BarangmasukModel;
use App\Models\Admin\BarangModel;
use App\Models\Admin\CustomerModel;
use App\Models\Admin\SatuanModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Yajra\DataTables\DataTables;

class BarangmasukController extends Controller
{
    public function index()
    {
        $data["title"] = "Barang Masuk";
        $data["hakTambah"] = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')->where(array('tbl_akses.role_id' => Session::get('user')->role_id, 'tbl_submenu.submenu_judul' => 'Barang Masuk', 'tbl_akses.akses_type' => 'create'))->count();
        $data["customer"] = CustomerModel::orderBy('customer_id', 'DESC')->get();
        $data["satuan"] =  SatuanModel::orderBy('satuan_id', 'DESC')->get();
        return view('Admin.BarangMasuk.index', $data);
    }

    public function show(Request $request)
    {
        if ($request->ajax()) {
            $data = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')->leftJoin('tbl_satuan', 'tbl_satuan.satuan_id', '=', 'tbl_barang.satuan_id')->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')->orderBy('bm_id', 'DESC')->get();
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
                ->addColumn('bm_density', function ($row) {
                    $bm_density = $row->bm_density == '' ? '-' : $row->bm_density;

                    return $bm_density;
                })
                ->addColumn('bm_no_polisi', function ($row) {
                    $bm_no_polisi = $row->bm_no_polisi == '' ? '-' : $row->bm_no_polisi;

                    return $bm_no_polisi;
                })
                ->addColumn('bm_surat_jalan', function ($row) {
                    $bm_surat_jalan = $row->bm_surat_jalan == '' ? '-' : $row->bm_surat_jalan;

                    return $bm_surat_jalan;
                })
                ->addColumn('bm_jumlah_masuk_actual', function ($row) {
                    $bm_jumlah_masuk_actual = $row->bm_jumlah_masuk_actual == '' ? '-' : $row->bm_jumlah_masuk_actual;

                    return $bm_jumlah_masuk_actual;
                })
                ->addColumn('keterangan', function ($row) {
                    $keterangan = $row->keterangan == '' ? '-' : $row->keterangan;

                    return $keterangan;
                })
                ->addColumn('jam_masuk', function ($row) {
                    $jam_masuk = $row->jam_masuk == '' ? '-' : $row->jam_masuk;

                    return $jam_masuk;
                })
                ->addColumn('action', function ($row) {
                    $array = array(
                        "bm_id" => $row->bm_id,
                        "bm_kode" => $row->bm_kode,
                        "barang_kode" => $row->barang_kode,
                        "customer_id" => $row->customer_id,
                        "bm_tanggal" => $row->bm_tanggal,
                        "bm_jumlah" => $row->bm_jumlah,
                        "bm_density" => $row->bm_density,
                        "bm_no_polisi" => $row->bm_no_polisi,
                        "bm_surat_jalan" => $row->bm_surat_jalan,
                        "bm_jumlah_masuk_actual" => $row->bm_jumlah_masuk_actual,
                        "keterangan" => $row->keterangan,
                        "jam_masuk" => $row->jam_masuk
                    );
                    $button = '';
                    $hakEdit = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')->where(array('tbl_akses.role_id' => Session::get('user')->role_id, 'tbl_submenu.submenu_judul' => 'Barang Masuk', 'tbl_akses.akses_type' => 'update'))->count();
                    $hakDelete = AksesModel::leftJoin('tbl_submenu', 'tbl_submenu.submenu_id', '=', 'tbl_akses.submenu_id')->where(array('tbl_akses.role_id' => Session::get('user')->role_id, 'tbl_submenu.submenu_judul' => 'Barang Masuk', 'tbl_akses.akses_type' => 'delete'))->count();
                    if ($hakEdit > 0 && $hakDelete > 0) {
                        $button .= '
                        <div class="g-2">
                        <a class="btn modal-effect text-primary btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Umodaldemo8" data-bs-toggle="tooltip" data-bs-original-title="Edit" onclick="update(' . htmlspecialchars(json_encode($array), ENT_QUOTES, 'UTF-8') . ')"><span class="fe fe-edit text-success fs-14"></span></a>
                        <a class="btn modal-effect text-danger btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Hmodaldemo8" onclick="hapus(' . htmlspecialchars(json_encode($array), ENT_QUOTES, 'UTF-8') . ')"><span class="fe fe-trash-2 fs-14"></span></a>
                        </div>
                        ';
                    } else if ($hakEdit > 0 && $hakDelete == 0) {
                        $button .= '
                        <div class="g-2">
                            <a class="btn modal-effect text-primary btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Umodaldemo8" data-bs-toggle="tooltip" data-bs-original-title="Edit" onclick="update(' . htmlspecialchars(json_encode($array), ENT_QUOTES, 'UTF-8') . ')"><span class="fe fe-edit text-success fs-14"></span></a>
                        </div>
                        ';
                    } else if ($hakEdit == 0 && $hakDelete > 0) {
                        $button .= '
                        <div class="g-2">
                        <a class="btn modal-effect text-danger btn-sm" data-bs-effect="effect-super-scaled" data-bs-toggle="modal" href="#Hmodaldemo8" onclick="hapus(' . htmlspecialchars(json_encode($array), ENT_QUOTES, 'UTF-8') . ')"><span class="fe fe-trash-2 fs-14"></span></a>
                        </div>
                        ';
                    } else {
                        $button .= '-';
                    }
                    return $button;
                })
                ->rawColumns(['action', 'tgl', 'customer', 'barang', 'satuan', 'bm_density', 'bm_no_polisi', 'bm_surat_jalan', 'bm_jumlah_masuk_actual'])->make(true);
        }
    }

    public function proses_tambah(Request $request)
    {

        //insert data
        BarangmasukModel::create([
            'bm_tanggal' => $request->tglmasuk,
            'jam_masuk'=> $request->jam_masuk,
            'bm_kode' => $request->bmkode,
            'barang_kode' => $request->barang,
            'customer_id'   => $request->customer,
            'bm_jumlah'   => $request->jml,
            'bm_density' => $request->density,
            'bm_no_polisi' => $request->noPolisi,
            'bm_surat_jalan' => $request->suratJalan,
            'bm_jumlah_masuk_actual' => $request->jumlahMasuk,
            'keterangan' => $request->keterangan
        ]);

        return response()->json(['success' => 'Berhasil']);
    }


    public function proses_ubah(Request $request, BarangmasukModel $barangmasuk)
    {
        //update data
        $barangmasuk->update([
            'bm_tanggal' => $request->tglmasuk,
            'barang_kode' => $request->barang,
            'customer_id'   => $request->customer,
            'bm_jumlah'   => $request->jml,
            "bm_density" => $request->bm_density,
            "bm_no_polisi" => $request->bm_no_polisi,
            "bm_surat_jalan" => $request->bm_surat_jalan,
            "bm_jumlah_masuk_actual" => $request->bm_jumlah_masuk_actual,
            "keterangan" => $request->keterangan,
            "jam_masuk" => $request->jam_masuk
        ]);

        return response()->json(['success' => 'Berhasil']);
    }

    public function proses_hapus(Request $request, BarangmasukModel $barangmasuk)
    {
        //delete
        $barangmasuk->delete();

        return response()->json(['success' => 'Berhasil']);
    }
}
