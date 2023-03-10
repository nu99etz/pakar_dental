<?php

defined('BASEPATH') or exit('No direct script access allowed');

class AuthController extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('AuthModel', 'auth');
    }

    public function index()
    {
        if ($this->session->userdata('logged')) {
            redirect('/');
        }

        $data = [
            'action' => base_url() . 'auth/doLogin'
        ];
        $this->load->view('include/header');
        $this->load->view('auth/index', $data);
    }

    public function register()
    {
        if ($this->session->userdata('logged')) {
            redirect('/');
        }

        $data = [
            'action' => base_url() . 'auth/doRegister'
        ];
        $this->load->view('include/header');
        $this->load->view('auth/register', $data);
    }

    public function doLogin()
    {
        if ($this->session->userdata('logged')) {
            redirect('/');
        }

        $login = $this->auth->doLogin();
        if ($login['status'] == false) {
            $response = [
                'status' => 422,
                'messages' => $login['messages']
            ];
        } else if ($login['status'] == true) {
            $session = [
                'logged' => true,
                'id_user' => $login['data']['id'],
                'username' => $login['data']['username'],
                'name' => $login['data']['nama_user'],
                'role' => $login['data']['id_role'],
            ];
            $this->session->set_userdata($session);
            $response = [
                'status' => 200,
                'messages' => $login['messages'],
                'url' => base_url()
            ];
        }

        echo json_encode($response);
    }

    public function doRegister()
    {
        if ($this->session->userdata('logged')) {
            redirect('/');
        }

        $register = $this->auth->doRegister();
        if ($register['status'] == false) {
            $response = [
                'status' => 422,
                'messages' => $register['messages']
            ];
        } else if ($register['status'] == true) {
            $response = [
                'status' => 200,
                'messages' => $register['messages'],
                'url' => base_url()
            ];
        }

        echo json_encode($response);
    }

    public function doLogout()
    {
        $this->session->set_userdata(array());
        $this->session->sess_destroy();

        $response = [
            'status' => 200,
            'messages' => 'anda sudah keluar dari sistem ',
            'url' => base_url(). 'auth',
        ];

        echo json_encode($response);
    }
}
