<?php

require_once 'core/page.php';
require_once 'core/session.php';

$user = $_POST['username'];
$pass = $_POST['password'];

	if(Session::open_session($user, $pass) ){
		echo "<h1>Welcome</h1>";
	}
	else{
		echo "<h2>Error</h2>";
	} 
?>
</html>



