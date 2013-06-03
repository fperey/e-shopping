<?php
class EsTable
{
	protected  $tableName;
	
	
	public function __construct(){
		$this->tableName = "Any";
	}
	
	public function name(){
		return $this->tableName;
	}

}