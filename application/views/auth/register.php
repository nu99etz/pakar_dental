<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

<body class="hold-transition register-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="<?php echo base_url(); ?>">PAKAR DENTAL</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Silahkan Mendaftar</p>

            <form id="form-register" action="<?php echo $action; ?>" method="post">
                <div class="form-group has-feedback">
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                </div>
                <div class="form-group has-feedback">
                    <input type="text" id="nama_user" name="nama_user" class="form-control" placeholder="Nama">
                </div>
                <div class="form-group has-feedback">
                    <textarea id="alamat" name="alamat" class="form-control" placeholder="Alamat"></textarea>
                </div>
                <div class="form-group has-feedback">
                    <input type="text" id="no_telp" name="no_telp" class="form-control" placeholder="No Telepon">
                </div>
                <div class="form-group has-feedback">
                    <input type="date" id="tgl_lahir" name="tgl_lahir" class="form-control" placeholder="Tanggal Lahir">
                </div>
                <div class="form-group has-feedback">
                    <select id="jk" name="jk" class="form-control">
                        <option>-- PILIH JENIS KELAMIN --</option>
                        <option value="L">Laki - laki</option>
                        <option value="P">Perempuan</option>
                    </select>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </div>
                <div class="row">
                    <!-- /.col -->
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-user-plus"></i> Daftar</button>
                    </div>
                    <!-- /.col -->
                </div>
                <br/>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="reset" class="btn btn-warning btn-block btn-flat"><i class="fa fa-refresh"></i> Reset</button>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="button" class="btn btn-danger btn-block btn-flat btn-back"><i class="fa fa-chevron-left"></i> Kembali</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.login-box -->
        <script>
            $(function() {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });

            $('.btn-back').on('click', function() {
                window.location.href = "<?php echo base_url();?>frontend";
            });

            $('#form-register').on('submit', function() {
                event.preventDefault();
                let _data = new FormData($(this)[0]);

                $(document).on('submit', 'form#form-register', function() {
                    event.preventDefault();
                    let _url = $(this).attr('action');
                    let _data = new FormData($(this)[0]);
                    send((data, xhr = null) => {
                        if (data.status == 422) {
                            FailedNotif(data.messages);
                        } else if (data.status == 200) {
                            Swal.fire({
                                type: 'success',
                                title: "Pendaftaran Sukses",
                                text: data.messages,
                                timer: 3000,
                                icon: 'success',
                                showCancelButton: false,
                                showConfirmButton: false
                            }).then(function() {
                                window.location.href = "<?php echo base_url();?>auth";
                            });
                        }
                    }, _url, 'json', 'post', _data);
                });
            });
        </script>
</body>

</html>