<?php

class EsDatabase {
	
	// Implementar Singleton
	
	public $hostname	=	"127.0.0.1";
	public $dbname		=	"es_users";
	public $username	=	"es_portal";
	public $password	=	"es_portal00";
	
	
	private $dbh=null;
	
	public function connect(){
		try {
			$this->dbh = new PDO("mysql:host=$this->hostname;dbname=$this->dbname", 
					$this->username, 
					$this->password,
					array(PDO::ATTR_PERSISTENT => true));
		}
		catch(PDOException $e)
		{
			echo $e->getMessage();
			return false;
		}
		return true;
	}
	
	
	public function disconnect(){
		if(!is_null($this->dbh)){
			$this->dbh = null;
			return true;
		}
		return false;
	}
	
	public function select($table,$conditions=NULL){
		try {
			$sql = "SELECT * from ". $table->name();
			if(!is_null($conditions)){
				$sql = $sql." where ".$conditions;
			}
						
			$stmt = $this->dbh->query($sql);
		
			$obj = $stmt->fetchALL(PDO::FETCH_CLASS, get_class($table));
			
			return $obj;
		}catch (PDOException $e){
			$e->getMessage();
		}
		return null;
	}
}
