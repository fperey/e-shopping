<?php

require_once 'base/Page.php';
require_once 'base/Session.php';


if(Session::check_session()){
}
else{
}

// echo file_get_contents('template/main.php');
Page::addScriptFile('boostrap.js');
Page::addStyleFile('bootstrap.css');
Page::renderPage("core",'Welcome/welcome.php');

?>