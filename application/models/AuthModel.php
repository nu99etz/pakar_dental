<?php

defined('BASEPATH') or exit('No direct script access allowed');

class AuthModel extends CI_Model
{
    public function doLogin()
    {
        $post = $this->input->post();
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if ($this->form_validation->run()) {
            $whereClause = [
                'username' => $post['username'],
                'password' => md5($post['password'])
            ];
            $sql = $this->db->select('*')->from('users')->where($whereClause)->get();
            $query = $sql->row_array();

            if (empty($query)) {
                $response = [
                    'status' => false,
                    'messages' => 'username dan password tidak ditemukan'
                ];
            } else {
                if ($query['username'] != $post['username']) {
                    $response = [
                        'status' => false,
                        'messages' => 'username yang diinput tidak cocok dengan sistem'
                    ];
                } else if ($query['password'] != md5($post['password'])) {
                    $response = [
                        'status' => false,
                        'messages' => 'password yang diinput tidak cocok dengan sistem'
                    ];
                } else {
                    $response = [
                        'status' => true,
                        'messages' => 'login sukses',
                        'data' => $query
                    ];
                }
            }
        } else {
            $response = [
                'status' => false,
                'messages' => validation_errors()
            ];
        }

        return $response;
    }

    public function doRegister()
    {
        $post = $this->input->post();
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('nama_user', 'Nama User', 'required');
        $this->form_validation->set_rules('alamat', 'Alamat', 'required');
        $this->form_validation->set_rules('no_telp', 'No Telepon', 'required');
        $this->form_validation->set_rules('tgl_lahir', 'Tanggal Lahir', 'required');
        $this->form_validation->set_rules('jk', 'Jenis Kelamin', 'required');

        if ($this->form_validation->run()) {

            $this->db->trans_begin();

            $data_insert = [
                "id_role" => 2,
                "nama_user" => $post['nama_user'],
                "username" => $post['username'],
                "password" => md5($post['password']),
                "created_at" => date('Y-m-d H:i:s')
            ];

            $query = $this->db->insert('users', $data_insert);

            if (!$query) {
                $response = [
                    'status' => false,
                    'messages' => 'Gagal input user'
                ];
            } else {
                $id_last = $this->db->insert_id();

                $register = [
                    'id_user' => $id_last,
                    'nama' => $post['nama_user'],
                    'alamat' => $post['alamat'],
                    'no_tlp' => $post['no_telp'],
                    'tanggal_lahir' => $post['tgl_lahir'],
                    'jenis_kelamin' => $post['jk'],
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s')
                ];

                $query = $this->db->insert('register', $register);

                $this->db->trans_commit();

                $response = [
                    'status' => true,
                    'messages' => 'Sukses input user',
                ];
            }
        } else {
            $response = [
                'status' => false,
                'messages' => validation_errors()
            ];
        }

        return $response;
    }
}
