<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';


class Mahasiswa extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Mahasiswa_model', 'mahasiswa');

		// NOTE: limit digunakan per method, per api_key, dan per jam -> yg di dokumentasi salah tulis harusnya methods
		$this->methods['index_get']['limit'] = 100;
	}

	public function index_get()
	{
		$id = $this->get('id'); // NOTE: ini getwhere dari library

		// if($id == null){
		// 	$mahasiswa = $this->mahasiswa->getMahasiswa();
		// } else{
		// 	$mahasiswa = $this->mahasiswa->getMahasiswa($id);
		// }

		// $mahasiswa = ($id == null) ? $this->mahasiswa->getMahasiswa() : $this->mahasiswa->getMahasiswa($id);
		$mahasiswa = $this->mahasiswa->getMahasiswa($id);

		if($mahasiswa){
			$this->response([
				'status' => true,
				'data' => $mahasiswa
			], REST_Controller::HTTP_OK); // NOTE: passing data dari mahasiswa, deng kase status 200(HTTP_OK)
		} else{
			$this->response([
				'status' => false,
				'message' => 'ID NOT FOUND'
			], REST_Controller::HTTP_NOT_FOUND); // NOTE: 404(NOT_FOUND)
		}
	}

	public function index_delete() { $id = $this->delete('id');

		if($id === null){
			$this->response([
				'status' => false,
				'message' => 'Provide an id to delete!'
			], REST_Controller::HTTP_BAD_REQUEST); // NOTE: dpe method do delete, mar nd ada id
		} else{

			if($this->mahasiswa->deleteMahasiswa($id) > 0){
				// OK
				$this->response([
					'status' => true,
					'id' => $id,
					'message' => 'deleted'
				], REST_Controller::HTTP_OK);
			} else{
				// id not found
				$this->response([
					'status' => false,
					'message' => 'ID NOT FOUND'
				], REST_Controller::HTTP_BAD_REQUEST);
			}
		}
	}

	public function index_post()
	{
		$data = [
			'nrp' => $this->post('nrp'),
			'nama' => $this->post('nama'),
			'email' => $this->post('email'),
			'jurusan' => $this->post('jurusan'),
		];

		if($this->mahasiswa->createMahasiswa($data) > 0){ // NOTE: effect dari affected_rows() jadi return  banyaknya kolom yang ada
			$this->response([
				'status' => true,
				'message' => 'New mahasiswa has been created'
			], REST_Controller::HTTP_CREATED); // NOTE: 401(HTTP_CREATED)
		} else{
			$this->response([
				'status' => false,
				'message' => 'Failed to insert data'
			], REST_Controller::HTTP_BAD_REQUEST); // NOTE: 400(HTTP_BAD_REQUEST)
		}
	}

	public function index_put()
	{
		$id = $this->put('id');
		$data = [
			'nrp' => $this->put('nrp'),
			'nama' => $this->put('nama'),
			'email' => $this->put('email'),
			'jurusan' => $this->put('jurusan'),
		];

		if($this->mahasiswa->updateMahasiswa($data, $id) > 0){
			$this->response([
				'status' => true,
				'message' => 'Successfully update data!'
			], REST_Controller::HTTP_OK);
		} else{
			$this->response([
				'status' => false,
				'message' => 'Failded to updated data'
			], REST_Controller::HTTP_BAD_REQUEST);
		}
	}

}
