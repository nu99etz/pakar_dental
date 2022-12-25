<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once('MainController.php');

class DashboardController extends MainController
{
    public function index()
	{
		if (!$this->session->userdata('logged')) {
            redirect('frontend/');
        }
        $layout = 'dashboard/index';
		$this->getLayout($layout);
	}

    public function indexFrontEnd()
    {
        $this->load->view('frontend/index');
    }

    public function indexFrontEndPanduan()
    {
        $this->load->view('frontend/panduan');
    }

    public function addKontak()
    {
        $post = $this->input->post();
        $this->db->trans_begin();
        try {
            $data = [
                'nama' => $post['nama'],
                'email' => $post['email'],
                'subject' => $post['subject']
            ];
            $this->db->insert('kontak', $data);
            $this->db->trans_commit();
            $validation = [
                'validation' => 'success'
            ];
            $this->session->set_userdata($validation);
            redirect('frontend/');
        } catch (\Exception $e) {
            $this->db->trans_rollback();
            $validation = [
                'validation' => 'failed'
            ];
            $this->session->set_userdata($validation);
            redirect('frontend/');
        }
    }
}