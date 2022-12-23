<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Detail History Konsultasi
            <small>Detail History Konsultasi</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active">Detail History Konsultasi</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
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
                            <?php foreach ($gejala['gejala'] as $key => $value) {
                            ?>
                                <tr>
                                    <td><?php echo $value[0]['kode_gejala']; ?></td>
                                    <td><?php echo $value[0]['nama_ms_kategori']; ?></td>
                                    <td><?php echo $value[0]['nama_gejala']; ?></td>
                                    <td><?php echo $gejala['nilai_kepercayaan'][$key]; ?></td>
                                </tr>
                            <?php   } ?>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- Default box -->
                <div class="box">
                    <div class="box-body">
                        <table id="penyakit" class="table table-bordered table-hover">
                            <tr>
                                <th>Kode Penyakit</th>
                                <th>Nama Penyakit</th>
                                <th>Pengobatan Penyakit</th>
                            </tr>
                            <?php foreach ($penyakit_fc['penyakit_fc'] as $key => $value) {
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
                                <th>Pengobatan Penyakit</th>
                                <th>Presentase</th>
                            </tr>
                            <?php $i = 0;
                            foreach ($penyakit_cf['penyakit_fc'] as $key => $value) {
                            ?>
                                <tr>
                                    <td><?php echo $value[0]['kode_penyakit']; ?></td>
                                    <td><?php echo $value[0]['nama_penyakit']; ?></td>
                                    <td><?php echo $value[0]['solusi_penyakit']; ?></td>
                                    <td><?php echo $penyakit_cf['presentase_cf'][$key]; ?> %</td>
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
                        <button type="button" class="btn btn-warning btn-flat" id="back"><i class="fa fa-chevron-left"></i> Kembali Ke History</button>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- /.content -->
</div>

<script>
    $('#back').on('click', function(e) {
        window.location.href = "<?php echo base_url(); ?>history";
    });
</script>