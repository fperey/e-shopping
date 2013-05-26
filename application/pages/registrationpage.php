<?php ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
		<title>Login Page</title>
	</head>
	
	<body>
		<form action="signup.php" method="post">
			<label for="name" >Name*:</label>
			<input id="name" type="text" name="name"></input>
		
			<label for="secondname" >Second Name*:</label>
			<input id="secondname" type="text" name="secondname"></input>
			
			<label for="lastname" >Last Name*:</label>
			<input id="lastname" type="text" name="lastname"></input>
			
			<label for="email" >Last Name*:</label>
			<input id="email" type="text" name="email"></input>
		
		
			<label for="username" >UserName*:</label>
			<input id="username" type="text" name="username"></input>
		
			<label for="password" >Password*:</label>
			<input id="password" type="password" name="password"></input>

			<label for="verifypassword" >Verify Password*:</label>
			<input id="verifyusername" type="password" name="verifypassword"></input>
			
			
			<input type='submit' name='Submit' value='Submit' />
		</form>
	</body>
</html>

