<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

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
        <div class="row">
            <div class="col-xs-12">
                <form id="konsultasi" method="post" action="<?php echo $action; ?>" enctype="multipart/form-data">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Ditemukan</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td>No.</td>
                                            <td>Kode Gejala</td>
                                            <td>Nama Gejala</td>
                                            <td>Jawaban</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $no = 1;
                                        foreach ($konsultasi as $key => $value) {
                                        ?>
                                            <tr>
                                                <td><?php echo $no++; ?></td>
                                                <td><?php echo $value['kode_gejala']; ?></td>
                                                <td><?php echo $value['nama_gejala']; ?></td>
                                                <td><?php echo $value['answer']; ?></td>
                                            </tr>
                                        <?php  } ?>
                                    </tbody>
                                </table>

                                <?php if (isset($penyakit) && $penyakit != NULL) {
                                ?>
                                    <input type="hidden" name="id_penyakit" value="<?php echo $penyakit['id_ms_penyakit']; ?>">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td>No.</td>
                                                <td>Kode Penyakit</td>
                                                <td>Nama Penyakit</td>
                                                <td>Komunikasi Informasi dan Edukasi</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1;
                                            // foreach ($penyakit as $key => $value) {
                                            ?>
                                            <tr>
                                                <td><?php echo $no++; ?></td>
                                                <td><?php echo $penyakit['kode_penyakit']; ?></td>
                                                <td><?php echo $penyakit['nama_penyakit']; ?></td>
                                                <td><?php echo $penyakit['solusi_penyakit']; ?></td>
                                            </tr>
                                            <?php
                                            // } 
                                            ?>
                                        </tbody>
                                    </table>
                                <?php  } else {
                                    echo "<h3>Penyakit tidak ditemukan</h3>";
                                } ?>

                                <div style="float: right;">
                                    <button type="submit" class="btn btn-primary btn-flat"><i class="fa fa-save"></i> Simpan</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>

<script>
    $(document).on('submit', 'form#konsultasi', function() {
        event.preventDefault();
        let _url = $(this).attr('action');
        let _data = new FormData($(this)[0]);
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
                });

            }
        }, _url, 'json', 'post', _data);
    });
</script>