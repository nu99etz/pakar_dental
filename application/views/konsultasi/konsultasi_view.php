<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Konsultasi
            <small>Konsultasi</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Konsultasi</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <?php if ($konsultasi['kemungkinan'] == 0) {
        ?>
            <div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-warning"></i> <b>Perhatian!</b></h4>
                <b>Kemungkinan ditemukan beberapa penyakit.</b>
            </div>
        <?php } else {
        ?>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> <b>Sukses!</b></h4>
                <b>Penyakit ditemukan.</b>
            </div>
        <?php } ?>
        <div class="row">
            <div class="col-xs-12">

                <!-- Default box -->
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Gejala Yang Dipilih</h3>
                    </div>
                    <div class="box-body">
                        <table id="gejala" class="table table-bordered table-hover">
                            <tr>
                                <th>Kode Gejala</th>
                                <th>Kategori Gejala</th>
                                <th>Nama Gejala</th>
                                <th>Nilai Kepercayaan</th>
                            </tr>
                            <?php foreach ($konsultasi['jawabanYa'] as $key => $value) {
                            ?>
                                <tr>
                                    <td><?php echo $value[0]['kode_gejala']; ?></td>
                                    <td><?php echo $value[0]['nama_ms_kategori']; ?></td>
                                    <td><?php echo $value[0]['nama_gejala']; ?></td>
                                    <td><?php echo $konsultasi['nilaiKepercayaan'][$key]; ?></td>
                                </tr>
                            <?php   } ?>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- Default box -->
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title"><?php if ($konsultasi['kemungkinan'] == 0) {
                                                    echo "Kemungkinan ditemukan beberapa penyakit dengan menggunakan metode Forward Chainning.";
                                                } else {
                                                    echo "Ditemukan penyakit dengan menggunakan metode Forward Chainning.";
                                                } ?></h3>
                    </div>
                    <div class="box-body">
                        <table id="penyakit" class="table table-bordered table-hover">
                            <tr>
                                <th>Kode Penyakit</th>
                                <th>Nama Penyakit</th>
                                <th>KIE</th>
                            </tr>
                            <?php foreach ($konsultasi['penyakit'] as $key => $value) {
                            ?>
                                <tr>
                                    <td><?php echo $value[0]['kode_penyakit']; ?></td>
                                    <td><?php echo $value[0]['nama_penyakit']; ?></td>
                                    <td><?php echo $value[0]['solusi_penyakit']; ?></td>
                                </tr>
                            <?php   } ?>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- Default box -->
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Menggunakan Certainly Factor</h3>
                    </div>
                    <div class="box-body">
                        <table id="penyakit" class="table table-bordered table-hover">
                            <tr>
                                <th>Kode Penyakit</th>
                                <th>Nama Penyakit</th>
                                <th>KIE</th>
                                <th>Presentase</th>
                            </tr>
                            <?php $i = 0;
                            foreach ($cf['penyakit'] as $key => $value) {
                            ?>
                                <tr>
                                    <td><?php echo $value[0]['kode_penyakit']; ?></td>
                                    <td><?php echo $value[0]['nama_penyakit']; ?></td>
                                    <td><?php echo $value[0]['solusi_penyakit']; ?></td>
                                    <td><?php echo $cf['score'][$i]; ?> %</td>
                                </tr>
                            <?php $i++;
                            } ?>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

            <div class="col-xs-12">
                <div style="float:right;">
                    <div class="form-group">
                        <button type="button" class="btn btn-primary btn-flat" id="save"><i class="fa fa-save"></i> Simpan</button>
                        <button type="button" class="btn btn-warning btn-flat" id="back"><i class="fa fa-chevron-left"></i> Kembali Konsultasi</button>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- /.content -->
</div>

<script>
    $('#back').on('click', function(e) {
        window.location.href = "<?php echo base_url(); ?>konsultasi";
    });

    $('#save').on('click', function(e) {
        let _url = "<?php echo $action; ?>"
        send((data, xhr = null) => {
            if (data.status == 422) {
                FailedNotif(data.messages);
            } else if (data.status == 200) {
                Swal.fire({
                    type: 'success',
                    title: "Konsultasi",
                    text: data.messages,
                    timer: 3000,
                    icon: 'success',
                    showCancelButton: false,
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = data.url;
                })
            }
        }, _url, 'json', 'get');
    });
</script>