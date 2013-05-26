<?php
class SessionEntity
{
	private $initialize;
	
	private $id;
	private $username;
	private $name;
	private $secondname;
	private $lastname;
	private $email;
	private $logindate;

	public function __construct(){
		$this->initialize = FALSE;
	}
	
	public function fetch(){
		$this->initialize = TRUE;
	}
	
	public function save(){		
	}
}

?>

