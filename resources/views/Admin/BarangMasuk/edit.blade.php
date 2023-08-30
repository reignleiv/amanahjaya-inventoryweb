<!-- MODAL EDIT -->
<div class="modal fade" data-bs-backdrop="static" id="Umodaldemo8">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h6 class="modal-title">Ubah Barang Masuk</h6><button aria-label="Close" onclick="resetU()"
                    class="btn-close" data-bs-dismiss="modal"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <input type="hidden" name="idbmU">
                        <div class="form-group">
                            <label for="bmkodeU" class="form-label">Kode Barang Masuk <span
                                    class="text-danger">*</span></label>
                            <input type="text" name="bmkodeU" readonly class="form-control" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="tglmasukU" class="form-label">Tanggal Masuk <span
                                    class="text-danger">*</span></label>
                            <input type="text" name="tglmasukU" class="form-control datepicker-date" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="customerU" class="form-label">Pilih Customer <span
                                    class="text-danger">*</span></label>
                            <select name="customerU" id="customerU" class="form-control">
                                <option value="">-- Pilih Customer --</option>
                                @foreach ($customer as $c)
                                    <option value="{{ $c->customer_id }}">{{ $c->customer_nama }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nopol" class="form-label">No Polisi<span class="text-danger">*</span></label>
                            <input type="text" name="noPolisiU" class="form-control" placeholder="" id="nopol">
                        </div>
                        <div class="form-group">
                            <label for="suratjalan" class="form-label">Surat Jalan<span
                                    class="text-danger">*</span></label>
                            <input type="text" name="suratJalanU" class="form-control" placeholder=""
                                id="suratjalan">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Kode Barang <span class="text-danger me-1">*</span>
                                <input type="hidden" id="statusU" value="true">
                                <div class="spinner-border spinner-border-sm d-none" id="loaderkdU" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </label>
                            <div class="input-group">
                                <input type="text" class="form-control" autocomplete="off" name="kdbarangU"
                                    placeholder="">
                                <button class="btn btn-primary-light" onclick="searchBarangU()" type="button"><i
                                        class="fe fe-search"></i></button>
                                <button class="btn btn-success-light" onclick="modalBarangU()" type="button"><i
                                        class="fe fe-box"></i></button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nama Barang</label>
                            <input type="text" class="form-control" id="nmbarangU" readonly>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Satuan</label>
                                    <input type="text" class="form-control" id="satuanU" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Jenis</label>
                                    <input type="text" class="form-control" id="jenisU" readonly>
                                </div>
                            </div>
                        </div>
                        {{-- <div class="form-group">
                            <label for="jmlU" class="form-label">Jumlah Masuk <span class="text-danger">*</span></label>
                            <input type="text" name="jmlU" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1').replace(/^0[^.]/, '0');" placeholder="">
                        </div> --}}
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="density" class="form-label">Density<span
                                            class="text-danger">*</span></label>
                                    <input type="number" name="densityU" class="form-control" placeholder=""
                                        id="densityU">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="jumlahMasuk" class="form-label">Jumlah Masuk<span
                                            class="text-danger">*</span></label>
                                    <input type="number" name="jumlahMasukU" class="form-control" placeholder=""
                                        id="jumlahMasukU">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="jml" class="form-label">Jumlah Masuk Actual</label>
                            <input type="number" name="jumlahMasukActualU" value="0" class="form-control"
                                placeholder="" id="jumlahMasukActualU" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success d-none" id="btnLoaderU" type="button" disabled="">
                    <span class="spinner-border spinner-border-sm me-1" role="status" aria-hidden="true"></span>
                    Loading...
                </button>
                <a href="javascript:void(0)" onclick="checkFormU()" id="btnSimpanU" class="btn btn-success">Simpan
                    Perubahan <i class="fe fe-check"></i></a>
                <a href="javascript:void(0)" class="btn btn-light" onclick="resetU()" data-bs-dismiss="modal">Batal
                    <i class="fe fe-x"></i></a>
            </div>
        </div>
    </div>
</div>

@section('formEditJS')
    <script>
        $('input[name="kdbarangU"]').keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                getbarangbyidU($('input[name="kdbarangU"]').val());
            }
        });

        function modalBarangU() {
            $('#modalBarang').modal('show');
            $('#Umodaldemo8').addClass('d-none');
            $('input[name="param"]').val('ubah');
            resetValidU();
            table2.ajax.reload();
        }

        function searchBarangU() {
            getbarangbyidU($('input[name="kdbarangU"]').val());
            resetValidU();
        }

        function getbarangbyidU(id) {
            $("#loaderkdU").removeClass('d-none');
            $.ajax({
                type: 'GET',
                url: "{{ url('admin/barang/getbarang') }}/" + id,
                processData: false,
                contentType: false,
                dataType: 'json',
                success: function(data) {
                    if (data.length > 0) {
                        $("#loaderkdU").addClass('d-none');
                        $("#statusU").val("true");
                        $("#nmbarangU").val(data[0].barang_nama);
                        $("#satuanU").val(data[0].satuan_nama);
                        $("#jenisU").val(data[0].jenisbarang_nama);
                    } else {
                        $("#loaderkdU").addClass('d-none');
                        $("#statusU").val("false");
                        $("#nmbarangU").val('');
                        $("#satuanU").val('');
                        $("#jenisU").val('');
                    }
                }
            });
        }

        function checkFormU() {
            const tglmasuk = $("input[name='tglmasukU']").val();
            const status = $("#statusU").val();
            const kdbarang = $("input[name='kdbarangU").val();
            const customer = $("select[name='customerU']").val();
            const jml = $("input[name='jmlU']").val();
            setLoadingU(true);
            resetValidU();

            if (tglmasuk == "") {
                validasi('Tanggal Masuk wajib di isi!', 'warning');
                $("input[name='tglmasukU']").addClass('is-invalid');
                setLoading(Ufalse);
                return false;
            } else if (customer == "") {
                validasi('Customer wajib di pilih!', 'warning');
                $("select[name='customerU']").addClass('is-invalid');
                setLoadingU(false);
                return false;
            } else if (status == "false" || kdbarang == '') {
                validasi('Barang wajib di pilih!', 'warning');
                $("input[name='kdbarangU']").addClass('is-invalid');
                setLoadingU(false);
                return false;
            } else if (jml == "" || jml == "0") {
                validasi('Jumlah Masuk wajib di isi!', 'warning');
                $("input[name='jmlU']").addClass('is-invalid');
                setLoadingU(false);
                return false;
            } else {
                submitFormU();
            }
        }

        function submitFormU() {
            const id = $("input[name='idbmU']").val();
            const bmkode = $("input[name='bmkodeU']").val();
            const tglmasuk = $("input[name='tglmasukU']").val();
            const kdbarang = $("input[name='kdbarangU']").val();
            const customer = $("select[name='customerU']").val();
            const jml = $("input[name='jumlahMasukU']").val();
            const noPolisi = $("input[name='noPolisiU']").val();
            const suratJalan = $("input[name='suratJalanU']").val();
            const density = $("input[name='densityU']").val();
            const jumlahMasukActual = $("input[name='jumlahMasukActualU']").val();

            console.log(bmkode,tglmasuk,kdbarang,customer,jml,density,noPolisi,suratJalan,jumlahMasukActual);

            $.ajax({
                type: 'POST',
                url: "{{ url('admin/barang-masuk/proses_ubah') }}/" + id,
                enctype: 'multipart/form-data',
                data: {
                    bmkode: bmkode,
                    tglmasuk: tglmasuk,
                    barang: kdbarang,
                    customer: customer,
                    jml: jml,
                    bm_no_polisi: noPolisi,
                    bm_surat_jalan: suratJalan,
                    bm_density: density,
                    bm_jumlah_masuk_actual: jumlahMasukActual
                },
                success: function(data) {
                    swal({
                        title: "Berhasil diubah!",
                        type: "success"
                    });
                    $('#Umodaldemo8').modal('toggle');
                    table.ajax.reload(null, false);
                    resetU();
                },
                error: function(xhr, status, error) {
                    // Handle errors here
                    console.error("AJAX Error:", error, status, xhr);
                    swal({
                        title: "Error",
                        text: "An error occurred while submitting the form.",
                        type: "error"
                    });
                }
            });
        }

        function resetValidU() {
            $("input[name='tglmasukU']").removeClass('is-invalid');
            $("input[name='kdbarangU']").removeClass('is-invalid');
            $("select[name='customerU']").removeClass('is-invalid');
            $("input[name='jmlU']").removeClass('is-invalid');
        };

        function resetU() {
            resetValidU();
            $("input[name='idbmU']").val('');
            $("input[name='bmkodeU']").val('');
            $("input[name='tglmasukU']").val('');
            $("input[name='kdbarangU']").val('');
            $("select[name='customerU']").val('');
            $("input[name='jmlU']").val('0');
            $("#nmbarangU").val('');
            $("#satuanU").val('');
            $("#jenisU").val('');
            $("#statusU").val('false');

            setLoadingU(false);
        }

        function setLoadingU(bool) {
            if (bool == true) {
                $('#btnLoaderU').removeClass('d-none');
                $('#btnSimpanU').addClass('d-none');
            } else {
                $('#btnSimpanU').removeClass('d-none');
                $('#btnLoaderU').addClass('d-none');
            }
        }

        // Event handlers for input fields
        $('#jumlahMasukU, #densityU').on('keyup change', function() {
            // Get values from input fields
            var jumlahMasuk = parseFloat($('#jumlahMasukU').val());
            var density = parseFloat($('#densityU').val());

            // Calculate density (assuming nopol length > 0)
            var jumlahMasukActual = jumlahMasuk / density;

            // Update the value of jumlahMasukActual
            $('#jumlahMasukActualU').val(jumlahMasukActual.toFixed(2));
        });
    </script>
@endsection
