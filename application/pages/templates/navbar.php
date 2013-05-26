<?php ?>
<div class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<a class="brand" href="#">E-Shopping</a>
		<ul class="nav pull-left">
			<li class="divider-vertical"></li>
			<li><a href="#">Services</a></li>
			<li class="divider-vertical"></li>
			<li><a href="#">About us</a></li>
			<li class="divider-vertical"></li>
			<li><a href="#">Contact</a></li>
			<li class="divider-vertical"></li>
		</ul>
		<ul class="nav pull-right">
			<li><a href="#">Sign Up</a></li>
			<form class="navbar-form pull-right" action="login.php" method="post">
				<input type="text" placeholder="username" name="username" class="span2"></input>
				<input type="password" placeholder="password" name="password" class="span2"></input>
				<button type="submit" class="btn">Sign In</button>
			</form>
		</ul>
	</div>
</div>