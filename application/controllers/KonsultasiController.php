<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once('MainController.php');
require_once("Formula.php");

class KonsultasiController extends MainController
{

    protected $gejalaSekarang;
    protected $gejalaSebelum;

    protected $tempPenyakit = [];
    protected $groupByPenyakit = [];

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

    private function setTempPenyakit($penyakit)
    {
        array_push($this->tempPenyakit, $penyakit);
        // set group by penyakit
        foreach($this->tempPenyakit as $valuePenyakit) {
            foreach($valuePenyakit as $valuePenyakit2) {
                if(!in_array($valuePenyakit2, $this->groupByPenyakit)) {
                    array_push($this->groupByPenyakit, $valuePenyakit2);
                }
            }
        }
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

    // private function forwardChainning($gejala)
    // {
    //     $this->setGejalaSebelum($gejala);

    //     // gabungkan semua gejala jawaban ya mulai dari gejala sebelumnya
    //     // G1->G2 dst sampai gejala yang dipilih habis
    //     $this->setGejalaSekarang($this->gejalaSebelum);

    //     // node gabungan gejala sekarang
    //     $whereLike = $this->getGejalaSekarang() . '%';

    //     // query ke tabel aturan sesuai node yang sudah digabung menjadi satu
    //     $sqlAturan = "select*from rule where gejala like '$whereLike'";
    //     $queryAturan = $this->db->query($sqlAturan)->result_array();
    //     $data = [];
    //     foreach ($queryAturan as $key => $value) {
    //         $exp = explode(",", $value['gejala']);
    //         if (in_array($gejala, $exp)) {
    //             $data[] = $queryAturan[$key];
    //         }
    //     }
    //     return $data;
    // }

    private function forwardChainning($gejala)
    {
        $this->setGejalaSebelum($gejala);

        // query ke tabel aturan sesuai node yang sudah digabung menjadi satu
        $sqlAturan = "select*from certainly_factor where id_gejala = $gejala";
        $queryAturan = $this->db->query($sqlAturan)->result_array();
        $data = [];
        foreach($queryAturan as $key => $value) {
            $data[] = $value['id_penyakit'];
        }
        return $data;
    }

    private function calculateForwardChaining()
    {   
        $dataMatch = [];
        foreach($this->groupByPenyakit as $valueGroupByPenyakit) {
            $match = 0;
            foreach($this->tempPenyakit as $valueTempByPenyakit) {
                if(in_array($valueGroupByPenyakit, $valueTempByPenyakit)) {
                    $match += 1;
                }
            }
            if($match > 2) {
                $dataMatch[] = $valueGroupByPenyakit;
            }
        }
        return $dataMatch;
    }

    private function matchingPenyakit($idPenyakit, $choiceGejala)
    {
        $rule_fc = $this->db->select('*')->from('certainly_factor')->where(['id_penyakit' => $idPenyakit])->get()->result_array();
        $totalAllGejala = count($rule_fc);
        if($totalAllGejala > 0) {
            $matchGejala = 0;
            foreach($rule_fc as $value) {
                if(in_array($value['id_gejala'], $choiceGejala)) {
                    $matchGejala += 1;
                }
            }

            if($matchGejala == $totalAllGejala) {
                return true;
            }

            return false;
        }

        return null;
    }

    // private function getForwardChainning($answer)
    // {
    //     $nodeJawabanYa = [];
    //     $penyakitNode = [];
    //     $nilaiKepercayaan = [];

    //     foreach ($answer as $key => $value) {
    //         // cek semua jawaban node jika jawaban ya maka gabung node menjadi satu
    //         if (isset($value)) {
    //             $nodeJawabanYa[] = $key;
    //             $nilaiKepercayaan[] = $value;
    //             $penyakit = $this->forwardChainning($key);
    //             if (!empty($penyakit)) {
    //                 $penyakitNode[] = $penyakit;
    //             }
    //         }
    //     }

    //     $this->maintence->Debug($penyakitNode);

    //     if (!empty($nodeJawabanYa)) {
    //         $implodeJawabanYa = implode(',', $nodeJawabanYa);
    //         if (!empty($penyakitNode)) {
    //             // cocokan node dan hasil query dari aturan
    //             $match = [];
    //             for ($i = 0; $i < count($penyakitNode); $i++) {
    //                 for ($j = 0; $j < count($penyakitNode[$i]); $j++) {
    //                     if ($implodeJawabanYa == $penyakitNode[$i][$j]['gejala']) {
    //                         $match[$penyakitNode[$i][$j]['id_ms_penyakit']] = 0;
    //                     } else {
    //                         $match[$penyakitNode[$i][$j]['id_ms_penyakit']] = 1;
    //                     }
    //                 }
    //             }

    //             // cek apakah ada nilai 0 dalam setiap kecocokan node
    //             foreach ($match as $key => $value) {
    //                 if ($value == 0) {
    //                     $cekPenyakit = $key;
    //                 }
    //             }

    //             if (empty($cekPenyakit)) {
    //                 $penyakit = [];
    //                 foreach ($match as $key => $value) {
    //                     $penyakit[] = $this->getPenyakit($key);
    //                 }
    //                 $kemungkinan = 0;
    //             } else {
    //                 $penyakit = [];
    //                 $penyakit[] = $this->getPenyakit($cekPenyakit);
    //                 $kemungkinan = 1;
    //             }
    //         } else {
    //             $penyakit = [];
    //             $kemungkinan = 1;
    //         }

    //         // mapping jawaban iya
    //         $jawabanYa = [];
    //         foreach ($nodeJawabanYa as $value) {
    //             $jawabanYa[] = $this->getGejala($value);
    //         }
    //     } else {
    //         $penyakit = [];
    //         $jawabanYa = [];
    //     }

    //     $data = [
    //         'jawabanYa' => $jawabanYa,
    //         'nilaiKepercayaan' => $nilaiKepercayaan,
    //         'penyakit' => $penyakit,
    //         'kemungkinan' => $kemungkinan
    //     ];

    //     return $data;
    // }

    private function getForwardChainning($answer)
    {
        $nodeJawabanYa = [];
        $penyakitNode = [];
        $nilaiKepercayaan = [];

        foreach ($answer as $key => $value) {
            // cek semua jawaban node jika jawaban ya maka gabung node menjadi satu
            if (isset($value)) {
                $nodeJawabanYa[] = $key;
                $nilaiKepercayaan[] = $value;
                $penyakit = $this->forwardChainning($key);
                if (!empty($penyakit)) {
                    $penyakitNode = $penyakit;
                }
                $this->setTempPenyakit($penyakitNode);
            }
        }

        // eliminate and calculate penyakit more than 3
        $penyakitNode = $this->calculateForwardChaining();

        // $this->maintence->Debug($nodeJawabanYa);

        if (!empty($nodeJawabanYa)) {
            if (!empty($penyakitNode)) {
                $idMatchPenyakit = null;
                $tempPenyakitMatch = [];
                for ($i = 0; $i < count($penyakitNode); $i++) {
                    // cek matching penyakit sesuai gejala
                    $match = $this->matchingPenyakit($penyakitNode[$i], $nodeJawabanYa);
                    if($match == true) {
                        $tempPenyakitMatch[] = $penyakitNode[$i];
                    }
                }

                if(!empty($tempPenyakitMatch)) {
                    if(count($tempPenyakitMatch) == 1) {
                        $penyakit = [];
                        $penyakit[] = $this->getPenyakit($tempPenyakitMatch[0]);
                        $kemungkinan = 1;
                    } else if(count($tempPenyakitMatch) > 1) {
                        $penyakit = [];
                        foreach ($penyakitNode as $valuePenyakitNode) {
                            $penyakit[] = $this->getPenyakit($valuePenyakitNode);
                        }
                        $kemungkinan = 0;
                    } else {
                        $penyakit = [];
                        $kemungkinan = 0;
                    }
                } else {
                    $penyakit = [];
                    foreach ($penyakitNode as $valuePenyakitNode) {
                        $penyakit[] = $this->getPenyakit($valuePenyakitNode);
                    }
                    $kemungkinan = 0;
                }

            } else {
                $penyakit = [];
                $kemungkinan = 0;
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
            'nilaiKepercayaan' => $nilaiKepercayaan,
            'penyakit' => $penyakit,
            'kemungkinan' => $kemungkinan
        ];

        return $data;
    }

    private function calculateCertainlyFactor($data, $answer)
    {
        $temp_cf = [];
        foreach ($data as $key => $value) {
            $cf = 0;
            $cfk = 0;
            $total = 0;
            $cf_2 = 0;
            $cf_arr = [];
            foreach ($answer as $key_answer => $value_answer) {
                if ($value['id_gejala'] == $key_answer) {
                    $cf = ($value['mb_value'] - $value['md_value']) * $value_answer;
                    $temp_cf[] = $cf;
                }
            }

            if(count($temp_cf) > 2) {
                for($i = 0; $i < count($temp_cf) - 1; $i++) {
                    if($cfk == 0) {
                        $cfk = $temp_cf[$i] + ($temp_cf[$i + 1] * (1 - $temp_cf[$i]));
                    } else {
                        $cfk = $cfk + ($temp_cf[$i + 1] * (1 - $cfk));
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
        $this->session->unset_userdata('is_save');

        $gejala = $this->konsultasi->getAllGejalaGrouping();
        $layout = 'konsultasi/index';
        $nilai_kepercayaan = [
            "1" => "Sangat Percaya",
            "0.8" => "Yakin",
            "0.6" => "Cukup Yakin",
            "0.4" => "Sedikit Yakin",
            "0.2" => "Tidak Tahu",
            "0" => "Tidak"
        ];
        $data = [
            'nilai_kepercayaan' => $nilai_kepercayaan,
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

        if (count($answer) >= 5) {
            $forward_chainning = $this->getForwardChainning($answer);
            $cf = $this->certainlyFactor($answer);

            // remove session
            $this->session->unset_userdata('fc');
            $this->session->unset_userdata('cf');
            $this->session->unset_userdata('is_save');

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
                'validation' => "Silahkan memilih minimal 5 gejala"
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
                $this->session->set_userdata(['is_save' => 1]);
                $response = [
                    'status' => 200,
                    'messages' => "Konsultasi berhasil disimpan",
                    'url' => base_url() . 'konsultasi'
                ];
            } else {
                $response = [
                    'status' => 422,
                    'messages' => "Konsultasi gagal disimpan"
                ];
            }
            echo json_encode($response);
        }
    }
}
