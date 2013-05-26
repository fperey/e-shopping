<?php
class Page{
	
	public static $stylesFiles = array();
	public static $scriptsFiles = array();
	
	public static function addStyleFile($fileName){
		self::$stylesFiles[] = $fileName;
		self::$stylesFiles = array_unique(self::$stylesFiles);
	}
	
	
	public static function addScriptFile($fileName){
		self::$scriptsFiles[] = $fileName;
		self::$scriptsFiles = array_unique(self::$scriptsFiles);
	}
	
	public static function fetchMainSection($pageName){
		include 'pages/' . $pageName;
	}
	
	public static function renderPage($pageName){
		include 'pages/header_tmp.php';

		foreach (Page::$scriptsFiles as $value){
			print "<link href=\"css/". $value ."\" rel=\"stylesheet\">\n";
		}
		
		print "<body>";
		self::fetchMainSection($pageName);
		print "<script src=\"http://code.jquery.com/jquery-1.9.1.min.js\"></script>\n";
		foreach (Page::$scriptsFiles as $value){
			print "<script src=\"js/". $value ."\"></script>\n";
		}
		print "</body>\n";
		print "</html>\n";
	}		
}
?>
