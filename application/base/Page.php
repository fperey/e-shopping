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
	
	public static function fetchMainSection($app,$pageName){
		include $app. '/pages/' . $pageName;
	}
	
	public static function renderPage($app,$pageName){
		include $app."/pages/header_tmp.php";

		foreach (Page::$stylesFiles as $value){
			print "<link href=\"".$app."/css/". $value ."\" rel=\"stylesheet\">\n";
		}
		
		print "<body>";
		self::fetchMainSection($app,$pageName);
		print "<script src=\"http://code.jquery.com/jquery-1.9.1.min.js\"></script>\n";
		foreach (Page::$scriptsFiles as $value){
			print "<script src=\"".$app."/js/". $value ."\"></script>\n";
		}
		print "</body>\n";
		print "</html>\n";
	}		
}
?>
