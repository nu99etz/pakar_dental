<?php

defined('BASEPATH') or exit('No direct script access allowed');

class KonsultasiModel extends CI_Model
{
    // public function getAllKonsultasi($where = null)
    // {
    //     if ($where != null) {
    //         $konsultasi = $this->db->select('*')->from('konsultasi')->where(['id' => $where])->get()->row_array();
    //         $detail_gejala = $this->db->query("select a.*, b.* from detail_gejala_konsultasi a left join gejala b on a.id_gejala = b.id where a.id_konsultasi = $where")->result_array();
    //         $detail_penyakit = $this->db->query("select a.*, b.* from detail_penyakit_konsultasi a left join penyakit b on a.id_penyakit = b.id where a.id_konsultasi = $where")->result_array();
    //         return [
    //             'konsultasi' => $konsultasi,
    //             'detail_gejala' => $detail_gejala,
    //             'detail_penyakit' => $detail_penyakit
    //         ];
    //     }

    //     $konsultasi = $this->db->select('*')->from('konsultasi')->order_by('tanggal_konsultasi', 'desc')->get();
    //     return $konsultasi->result_array();
    // }

    public function getAllGejalaGrouping()
    {
        $sql = $this->db->select('*')
            ->from('ms_gejala')
            ->join('ms_kategori_gejala', 'ms_kategori_gejala.id_ms_kategori_gejala = ms_gejala.id_ms_kategori_gejala', 'left')
            ->order_by('ms_gejala.id_ms_kategori_gejala', 'ASC')
            ->get();
        $gejala = $sql->result_array();
        $data = [];
        foreach ($gejala as $key => $value) {
            $data[$value['nama_ms_kategori']][] = $value;
        }
        return $data;
    }

    public function getAllKonsultasi($where = null)
    {
        $konsultasi = $this->db->select('*')->from('konsultasi');
        if ($where != null) {
            $konsultasi->where($where);
        }
        return $konsultasi->get()->result_array();
    }

    public function checkIDExist()
    {
        $konsultasi = $this->db->select('id')->from('konsultasi')->order_by('id', 'desc')->get()->row_array();
        // return $konsultasi->row_array();
        if (empty($konsultasi)) {
            $id = 1;
            return $id;
        } else {
            $id = $konsultasi['id'] + 1;
            return $id;
        }
    }

    public function getTempKonsultasi($id_user)
    {
        $konsultasi = $this->db->select('*')->from('tmp_konsultasi')->where(['id_user' => $id_user])->get();
        return $konsultasi->result_array();
    }

    public function storeKonsultasi($param)
    {
        $this->db->trans_begin();
        try {
            $data_konsultasi = [
                'id_user' => $param['id_user'],
                'tanggal_konsultasi' => $param['tanggal_konsultasi']
            ];
            $this->db->insert('konsultasi', $data_konsultasi);
            $id_konsultasi = $this->db->insert_id();

            foreach ($param['konsultasi']['fc']['jawabanYa'] as $key => $value) {
                $detail_konsultasi_gejala = [
                    'id_konsultasi' => $id_konsultasi,
                    'id_gejala' => $value[0]['id_ms_gejala'],
                    'nilai_kepercayaan ' => $param['konsultasi']['fc']['nilaiKepercayaan'][$key]
                ];
                $this->db->insert('detail_konsultasi_gejala', $detail_konsultasi_gejala);
            }

            foreach ($param['konsultasi']['fc']['penyakit'] as $key => $value) {
                $detail_konsultasi_penyakit = [
                    'id_konsultasi' => $id_konsultasi,
                    'id_penyakit' => $value[0]['id_ms_penyakit'],
                    'type' => 1,
                ];
                $this->db->insert('detail_konsultasi_penyakit', $detail_konsultasi_penyakit);
            }

            // insert cf
            $i = 0;
            foreach ($param['konsultasi']['cf']['penyakit'] as $key => $value) {
                $detail_konsultasi_penyakit = [
                    'id_konsultasi' => $id_konsultasi,
                    'id_penyakit' => $value[0]['id_ms_penyakit'],
                    'type' => 2,
                    'presentase_cf' => $param['konsultasi']['cf']['score'][$i]
                ];
                $this->db->insert('detail_konsultasi_penyakit', $detail_konsultasi_penyakit);
                $i++;
            }

            $this->db->trans_commit();
            return true;
        } catch (Exception $e) {
            $this->db->trans_rollback();
            return false;
        }
    }

    public function historyKonsultasi($param = null)
    {
        $history = $this->db->select('*')->from('konsultasi')->order_by('id_konsultasi', 'desc');
        if ($param != null) {
            $history->where($param);
        }

        $history = $history->get()->result_array();
        return $history;
    }

    public function deleteKonsultasi($id)
    {
        $this->db->where(['id_konsultasi' => $id])->delete('konsultasi');
        return [
            'status' => true,
            'messages' => 'Data Sukses Dihapus'
        ];
    }
}
