<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once('MainController.php');
require_once("Formula.php");

class KonsultasiController extends MainController
{

    protected $gejalaSekarang;
    protected $gejalaSebelum;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('GejalaModel', 'gejala');
        $this->load->model('PenyakitModel', 'penyakit');
        $this->load->model('KonsultasiModel', 'konsultasi');
        $this->load->model('ForwardChainningModel', 'fc');
    }

    private function setGejalaSebelum($gejala)
    {
        $this->gejalaSebelum[] = $gejala;
    }

    private function setGejalaSekarang($gejala)
    {
        // if ($gejala[0]) {
        //     $this->gejalaSekarang = $gejala[0] . ",";
        // } else {
        //     $this->gejalaSekarang = implode(',', $gejala);
        // }
        if (count($gejala) > 1) {
            $this->gejalaSekarang = implode(',', $gejala);
        } else {
            $this->gejalaSekarang = $gejala[0] . ",";
        }
    }

    private function getGejalaSekarang()
    {
        return $this->gejalaSekarang;
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

    private function forwardChainning($gejala)
    {
        $this->setGejalaSebelum($gejala);

        // gabungkan semua gejala jawaban ya mulai dari gejala sebelumnya
        // G1->G2 dst sampai gejala yang dipilih habis
        $this->setGejalaSekarang($this->gejalaSebelum);

        // node gabungan gejala sekarang
        $whereLike = $this->getGejalaSekarang() . '%';

        // query ke tabel aturan sesuai node yang sudah digabung menjadi satu
        $sqlAturan = "select*from rule where gejala like '$whereLike'";
        $queryAturan = $this->db->query($sqlAturan)->result_array();
        $data = [];
        foreach ($queryAturan as $key => $value) {
            $exp = explode(",", $value['gejala']);
            if (in_array($gejala, $exp)) {
                $data[] = $queryAturan[$key];
            }
        }
        return $data;
    }

    private function getForwardChainning($answer)
    {
        $nodeJawabanYa = [];
        $penyakitNode = [];

        foreach ($answer as $key => $value) {
            // cek semua jawaban node jika jawaban ya maka gabung node menjadi satu
            if (isset($value)) {
                // if ($value == "0") {
                //     // Maintence::debug($key);
                //     $nodeJawabanYa[] = $key;
                //     $penyakit = $this->forwardChainning($key);
                //     if (!empty($penyakit)) {
                //         $penyakitNode[] = $penyakit;
                //     }
                // }
                $nodeJawabanYa[] = $key;
                $penyakit = $this->forwardChainning($key);
                if (!empty($penyakit)) {
                    $penyakitNode[] = $penyakit;
                }
            }
        }

        if (!empty($nodeJawabanYa)) {
            $implodeJawabanYa = implode(',', $nodeJawabanYa);
            if (!empty($penyakitNode)) {
                // cocokan node dan hasil query dari aturan
                $match = [];
                for ($i = 0; $i < count($penyakitNode); $i++) {
                    for ($j = 0; $j < count($penyakitNode[$i]); $j++) {
                        if ($implodeJawabanYa == $penyakitNode[$i][$j]['gejala']) {
                            $match[$penyakitNode[$i][$j]['id_ms_penyakit']] = 0;
                        } else {
                            $match[$penyakitNode[$i][$j]['id_ms_penyakit']] = 1;
                        }
                    }
                }

                // cek apakah ada nilai 0 dalam setiap kecocokan node
                foreach ($match as $key => $value) {
                    if ($value == 0) {
                        $cekPenyakit = $key;
                    }
                }

                if (empty($cekPenyakit)) {
                    $penyakit = [];
                    foreach ($match as $key => $value) {
                        $penyakit[] = $this->getPenyakit($key);
                    }
                    $kemungkinan = 0;
                } else {
                    $penyakit = [];
                    $penyakit[] = $this->getPenyakit($cekPenyakit);
                    $kemungkinan = 1;
                }
            } else {
                $penyakit = [];
                $kemungkinan = 1;
            }

            // mapping jawaban iya
            $jawabanYa = [];
            foreach ($nodeJawabanYa as $value) {
                $jawabanYa[] = $this->getGejala($value);
            }
        } else {
            $penyakit = [];
            $jawabanYa = [];
        }

        $data = [
            'jawabanYa' => $jawabanYa,
            'penyakit' => $penyakit,
            'kemungkinan' => $kemungkinan
        ];

        return $data;
    }

    private function calculateCertainlyFactor($data, $answer)
    {
        foreach ($data as $key => $value) {
            $cf = 0;
            $cfk = 0;
            $total = 0;
            foreach ($answer as $key_answer => $value_answer) {
                if ($value['id_gejala'] == $key_answer) {
                    $cf = ($value['mb_value'] - $value['md_value']) * $value_answer;
                    if ($cfk == 0) {
                        $cfk = $cf + (0 * (1 - $cf));
                    } else {
                        $cfk = $cfk + ($cf * (1 - $cfk));
                    }
                }
            }
            $total = $cfk * 100;
        }
        return $total;
    }

    private function certainlyFactor($data)
    {
        $penyakit = $this->penyakit->getAllPenyakit();
        $calculate = [];
        foreach ($penyakit as $key => $value) {
            $cf = $this->db->from('certainly_factor')
                ->where(['id_penyakit' => $value['id_ms_penyakit']])
                ->get()
                ->result_array();
            $result = $this->calculateCertainlyFactor($cf, $data);
            if ($result > 0) {
                $calculate[$value['id_ms_penyakit']] = $result;
            }
        }
        if (count($calculate) > 0) {
            arsort($calculate);
            $data = [];
            foreach ($calculate as $key => $value) {
                $data['penyakit'][] = $this->getPenyakit($key);
                $data['score'][] = $value;
            }
        }
        return $data;
    }

    private function mappingKonsultasi($data)
    {
        $konsultasi = [];
        foreach ($data as $key => $value) {
            $row = [];
            $row['kode_gejala'] = $this->gejala->getGejala($value['id_ms_gejala'], 'kode_gejala');
            $row['nama_gejala'] = $this->gejala->getGejala($value['id_ms_gejala'], 'nama_gejala');
            if ($value['answer'] == 0) {
                $answer = 'Ya';
            } else if ($value['answer'] == 1) {
                $answer = 'Tidak';
            }
            $row['answer'] = $answer;
            $konsultasi[] = $row;
        }
        return $konsultasi;
    }

    private function mappingPenyakit($data)
    {
        $penyakit = [];
        $penyakit['id_ms_penyakit'] = $this->penyakit->getPenyakit($data, 'id_ms_penyakit');
        $penyakit['kode_penyakit'] = $this->penyakit->getPenyakit($data, 'kode_penyakit');
        $penyakit['nama_penyakit'] = $this->penyakit->getPenyakit($data, 'nama_penyakit');
        $penyakit['solusi_penyakit'] = $this->penyakit->getPenyakit($data, 'solusi_penyakit');
        return $penyakit;
    }

    public function index()
    {
        if (!$this->session->userdata('logged')) {
            redirect('auth/');
        }

        $id_user = $this->session->userdata('id_user');
        $this->fc->removeTempKonsultasi($id_user);
        // remove session
        $this->session->unset_userdata(['fc', 'cf']);

        $gejala = $this->konsultasi->getAllGejalaGrouping();
        // $this->maintence->Debug($gejala);
        $layout = 'konsultasi/index';
        $data = [
            // 'parent_gejala' => 0,
            'gejala' => $gejala,
            'action' => base_url() . 'konsultasi/result'
        ];
        $this->getLayout($layout, $data);
    }

    public function result()
    {
        $post = $this->input->post();
        // cek jumlah jawaban
        $answer = [];
        foreach ($post['nilai_cf'] as $key => $value) {
            if ($value != null && $value != "") {
                $answer[$key] = $value;
            }
        }

        if (count($answer) > 3) {
            $forward_chainning = $this->getForwardChainning($answer);
            $cf = $this->certainlyFactor($answer);

            // remove session
            $this->session->unset_userdata('fc');
            $this->session->unset_userdata('cf');

            // save ke session sementara
            $this->session->set_userdata([
                'fc' => $forward_chainning,
                'cf' => $cf
            ]);
            $data = [
                // 'parent_gejala' => 0,
                'konsultasi' => $forward_chainning,
                'cf' => $cf,
                'action' => base_url() . 'konsultasi/store'
            ];
            // $this->maintence->Debug($data);
            $layout = 'konsultasi/konsultasi_view';
            $this->getLayout($layout, $data);
        } else {
            $validation = [
                'validation' => "Silahkan memilih minimal 3 gejala"
            ];
            $this->session->set_userdata($validation);
            redirect('konsultasi/');
        }

        // $this->maintence->Debug($answer);
    }

    public function store()
    {
        $post = $this->input->post();
        if ($this->session->userdata('id_user') != null) {
            $id_user = $this->session->userdata('id_user');
            $param = [
                "id_user" => $id_user,
                "tanggal_konsultasi" => date('Y-m-d'),
                "konsultasi" => [
                    'fc' => $this->session->userdata('fc'),
                    'cf' => $this->session->userdata('cf')
                ]
            ];
            $insert_konsultasi = $this->konsultasi->storeKonsultasi($param);
            if ($insert_konsultasi) {
                // remove session
                $this->session->unset_userdata('fc');
                $this->session->unset_userdata('cf');
                $response = [
                    'status' => 200,
                    'messages' => "Konsultasi berhasil disimpan",
                    'url' => base_url()
                ];
            } else {
                $response = [
                    'status' => 200,
                    'messages' => "Konsultasi gagal disimpan"
                ];
            }
            echo json_encode($response);
        }
    }

    public function ajax()
    {
        $konsultasi = $this->konsultasi->getAllKonsultasi();
        $no = 1;
        $record = [];
        foreach ($konsultasi as $value) {
            $row = [];
            $row[] = $no;
            $row[] = $value['nama_pemilik_hewan'];
            $row[] = $value['nama_hewan'];
            $row[] = $value['usia_hewan'];
            $row[] = $value['tanggal_konsultasi'];
            $row[] = '<button type="button" name="lihat" action="' . base_url() . 'rep_konsultasi/' . $value['id'] . '" class="btn-lihat btn btn-flat btn-primary btn-sm"><i class = "fa fa-eye"></i> Lihat Hasil</button> ';
            $no++;
            $record[] = $row;
        }
        echo json_encode([
            'data' => $record
        ]);
    }

    public function indexReport()
    {
        if (!$this->session->userdata('logged') || $this->session->userdata('role') != 1) {
            redirect('auth/');
        }
        $layout = 'konsultasi/list_report';
        $this->getLayout($layout);
    }

    public function getReport($id)
    {
        $layout = 'konsultasi/konsultasi_view';
        $konsultasi = $this->konsultasi->getAllKonsultasi($id);
        $data = [
            'konsultasi' => $konsultasi,
        ];
        $this->load->view($layout, $data);
    }

    public function penjelasanGejala($id)
    {
        $layout = 'gejala/form_penjelasan';
        $gejala = $this->gejala->getGejala($id);
        $data = [
            'gejala' => $gejala,
        ];
        $this->load->view($layout, $data);
    }
}
