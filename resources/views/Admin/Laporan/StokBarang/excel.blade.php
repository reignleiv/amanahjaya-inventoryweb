<!DOCTYPE html>
<html lang="en">

<?php

use App\Models\Admin\BarangkeluarModel;
use App\Models\Admin\BarangmasukModel;

use Carbon\Carbon;
?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="{{ $web->web_deskripsi }}">
    <meta name="author" content="{{ $web->web_nama }}">
    <meta name="keywords" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}" />

    <!-- FAVICON -->
    @if ($web->web_logo == '' || $web->web_logo == 'default.png')
        <link rel="shortcut icon" type="image/x-icon" href="{{ url('/assets/default/web/default.png') }}" />
    @else
        <link rel="shortcut icon" type="image/x-icon" href="{{ asset('storage/web/' . $web->web_logo) }}" />
    @endif

    <title>{{ $title }}</title>

</head>
<body>
    <table border="1" id="table1">
        <thead>
            <tr>
                <th align="center" width="1%">NO</th>
                <th>KODE BARANG</th>
                <th>BARANG</th>
                <th>STOK AWAL</th>
                <th>JML MASUK</th>
                <th>JML KELUAR</th>
                <th>TOTAL</th>
                <th>Loss/Gain</th>
            </tr>
        </thead>
        <tbody>
            @php $no=1; @endphp
            @foreach ($data as $d)
                <?php
                if ($tglawal == '') {
                    $jmlmasuk = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
                        ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
                        ->where('tbl_barangmasuk.barang_kode', '=', $d->barang_kode)
                        ->sum('tbl_barangmasuk.bm_jumlah');
                } else {
                    $jmlmasuk = BarangmasukModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangmasuk.barang_kode')
                        ->leftJoin('tbl_supplier', 'tbl_supplier.customer_id', '=', 'tbl_barangmasuk.customer_id')
                        ->where('tbl_barangmasuk.barang_kode', '=', $d->barang_kode)
                        ->whereBetween('bm_tanggal', [$tglawal, $tglakhir])
                        ->sum('tbl_barangmasuk.bm_jumlah');
                }
                
                if ($tglawal != '') {
                    $jmlkeluar = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                        ->whereBetween('bk_tanggal', [$tglawal, $tglakhir])
                        ->where('tbl_barangkeluar.barang_kode', '=', $d->barang_kode)
                        ->sum('tbl_barangkeluar.bk_jumlah');
                } else {
                    $jmlkeluar = BarangkeluarModel::leftJoin('tbl_barang', 'tbl_barang.barang_kode', '=', 'tbl_barangkeluar.barang_kode')
                        ->where('tbl_barangkeluar.barang_kode', '=', $d->barang_kode)
                        ->sum('tbl_barangkeluar.bk_jumlah');
                }
                
                $totalStok = $d->barang_stok + ($jmlmasuk - $jmlkeluar);
                $lossgain = $d->barang_stok - $totalStok;
                
                ?>
                <tr>
                    <td align="center">{{ $no++ }}</td>
                    <td>{{ $d->barang_kode }}</td>
                    <td>{{ $d->barang_nama }}</td>
                    <td align="center">{{ $d->barang_stok }}</td>
                    <td align="center">{{ $jmlmasuk }}</td>
                    <td align="center">{{ $jmlkeluar }}</td>
                    <td align="center">{{ $totalStok }}</td>
                    <td align="center">{{ $lossgain }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>
