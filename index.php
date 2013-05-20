<?php
	require_once 'core/page.php';
	// echo file_get_contents('template/main.php');
	
	Page::addScriptFile('boostrap.js');
	Page::addStyleFile('bootstrap.css');
	Page::renderPage('main.php');
?>