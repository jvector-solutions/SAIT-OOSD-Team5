<?php
	$conn=mysql_connect('localhost','root','');
	if(!$conn)
	{
		die("MYSQL CONNECTION ERROR");
	}	
	$sql_connect=mysql_select_db('login',$conn);
	if(!$sql_connect)
	{
	die("MYSQL DATABASE CONNECTION FAIL");
	}
		
?>