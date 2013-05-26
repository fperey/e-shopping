<?php

require_once 'core/page.php';
require_once 'core/session.php';


if(Session::check_session()){
}
else{
}

// echo file_get_contents('template/main.php');
Page::addScriptFile('boostrap.js');
Page::addStyleFile('bootstrap.css');
Page::renderPage('Welcome/welcome.php');

?>