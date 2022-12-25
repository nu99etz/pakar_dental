<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once('MainController.php');

class HistoryController extends MainController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('GejalaModel', 'gejala');
        $this->load->model('PenyakitModel', 'penyakit');
        $this->load->model('KonsultasiModel', 'konsultasi');
        $this->load->model('ForwardChainningModel', 'fc');
    }

    public function ajax()
    {
        if($this->session->userdata('role') == 2) {
            $id_user = $this->session->userdata('id_user');
            $param = ['id_user' => $id_user];
        } else {
            $param = null;
        }
        $data = $this->konsultasi->historyKonsultasi($param);
        $no = 1;
        $record = [];
        foreach ($data as $value) {
            $row = [];
            $row[] = $no;
            $row[] = $this->date->getDate($value['tanggal_konsultasi']);
            if($this->session->userdata('role') == 1) {
                $user = $this->getUser($value['id_user']);
                $row[] = $user['nama_user'];
            }
            $button = '<button type="button" name="lihat" action="' . base_url() . 'history/detail/' . $value['id_konsultasi'] . '" class="btn-lihat btn btn-flat btn-primary btn-sm"><i class = "fa fa-eye"></i></button> ';
            $button .= '<button type="button" name="delete" action="' . base_url() . 'history/destroy/' . $value['id_konsultasi'] . '" class="btn-delete btn btn-flat btn-danger btn-sm"><i class = "fa fa-trash"></i></button> ';
            $row[] = $button;
            $no++;
            $record[] = $row;
        }
        echo json_encode([
            'data' => $record
        ]);
    }

    private function getGejala($id)
    {
        $sqlGejala = "select*from ms_gejala left join ms_kategori_gejala on ms_kategori_gejala.id_ms_kategori_gejala = ms_gejala.id_ms_kategori_gejala where id_ms_gejala = $id";
        $queryGejala = $this->db->query($sqlGejala);
        $gejala = $queryGejala->result_array();
        return $gejala;
    }

    private function getPenyakit($id)
    {
        $sqlPenyakit = "select*from ms_penyakit where id_ms_penyakit = $id";
        $queryPenyakit = $this->db->query($sqlPenyakit);
        $penyakit = $queryPenyakit->result_array();
        return $penyakit;
    }

    private function getUser($id)
    {
        $user = $this->db->select('*')->from('users')->where(['id' => $id])->get();
        return $user->row_array();
    }

    public function index()
    {
        $layout = 'history/index';
        $this->getLayout($layout);
    }

    public function detailHistory($id)
    {

        $param = null;
        if ($this->session->userdata('role') == 2) {
            $id_user = $this->session->userdata('id_user');
            $param = [
                'id_konsultasi' => $id,
                'id_user' => $id_user
            ];
        } else {
            $param = [
                'id_konsultasi' => $id,
            ];
        }

        $konsultasi = $this->db->select('*')->from('konsultasi')->where($param)->get()->row_array();
        if(empty($konsultasi)) {
            redirect(base_url() . "history");
        }

        $gejala = $this->db->select('*')->from('detail_konsultasi_gejala')->where(['id_konsultasi' => $id])->get()->result_array();
        $map_gejala = [];
        foreach($gejala as $key => $value) {
            $map_gejala['gejala'][] = $this->getGejala($value['id_gejala']);
            $map_gejala['nilai_kepercayaan'][] = $value['nilai_kepercayaan'];
        }

        $penyakit_fc = $this->db->select('*')->from('detail_konsultasi_penyakit')->where([
            'id_konsultasi' => $id,
            'type' => 1
        ])->get()->result_array();
        $map_penyakit_fc = [];
        foreach($penyakit_fc as $key => $value) {
            $map_penyakit_fc['penyakit_fc'][] = $this->getPenyakit($value['id_penyakit']);
        }

        $penyakit_cf = $this->db->select('*')->from('detail_konsultasi_penyakit')->where([
            'id_konsultasi' => $id,
            'type' => 2
        ])->get()->result_array();
        $map_penyakit_cf = [];
        foreach($penyakit_cf as $key => $value) {
            $map_penyakit_cf['penyakit_fc'][] = $this->getPenyakit($value['id_penyakit']);
            $map_penyakit_cf['presentase_cf'][] = $value['presentase_cf'];
        }

        $data = [
            'gejala' => $map_gejala,
            'penyakit_fc' => $map_penyakit_fc,
            'penyakit_cf' => $map_penyakit_cf,
            'user_detail' => $this->getUser($konsultasi['id_user']),
            'tanggal_konsultasi' => $this->date->getdate($konsultasi['tanggal_konsultasi'])

        ];

        $layout = 'history/detail_view';
        $this->getLayout($layout, $data);

    }

    public function deleteHistory($id)
    {
        $destroy = $this->konsultasi->deleteKonsultasi($id);
        if ($destroy['status'] == true) {
            $response = [
                'status' => 200,
                'messages' => $destroy['messages']
            ];
        } else if ($destroy['status'] == false) {
            $response = [
                'status' => 422,
                'messages' => $destroy['messages']
            ];
        }
        echo json_encode($response);
    }
}