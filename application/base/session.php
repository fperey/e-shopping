<?php

require_once "base/database.php";

class Session
{	
	static function open_session($user,$pass){
		$query = "select * from es_user_accounts where username='".
					$user."' and password='".$pass."' and blocked=false";
		
		$db = new Database("localhost", "es_portal", "es_portal00","es_users");
		
		if($qid = $db->query($query)){
			if($db->num_rows($qid)){
				// Create Session
				session_start();
				$_SESSION["username"]=$user;
				return true;
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