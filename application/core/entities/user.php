<?php
class UserPk{
	public $id;
}


class User{
	public $id;
	public $firstname;
	public $secondname;
	public $lastname;
	public $birthdate;
	
	public function __construct(){
		$this->id = new UserPk();
	}
}	
?>