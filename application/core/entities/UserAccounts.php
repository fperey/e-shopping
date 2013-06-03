<?php

require_once "base/EsTable.php";

class UserAccounts extends EsTable
{
	public $id;
	public $idUser;
	public $username;
	public $password;
	public $creationDate;
	public $expirationDate;
	public $blocked;
	
	public function __construct(){
		$this->tableName = "es_user_accounts";
	}
	
		
}

?>
