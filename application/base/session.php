<?php

require_once 'core/entities/UserAccounts.php';
require_once "base/EsDatabase.php";

class Session
{	
	static function open_session($user,$pass){
		
		$db = new EsDatabase();
		$userAccounts = new UserAccounts;
		$where = "username='".$user."' and password='".$pass."' and blocked=false";
		
		if($db->connect()){
			$obj = $db->select($userAccounts,$where);
			
			if(!is_null($obj)){
				if(count($obj)>0){
					// Create Session
					session_start();
					$_SESSION["username"]=$user;
					return true;
				}
			}
		}
		return false;
	}
	
	static function check_session(){
		session_start();
		if(isset($_SESSION["username"])){
			return true;
		}
		return false;
	}
	
	static function close_session(){
		session_start();
		if(isset($_SESSION["username"])){
			session_destroy();
			return true;
		}
		return false;
	}
}