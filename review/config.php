<?php
	$conn=mysqli_connect("localhost","root","","travelexperts") or die("MYSQL CONNECTION ERROR");	
	$sql_connect=mysqli_select_db($conn,"users");
	if(!$sql_connect) {
	   die("MYSQL DATABASE CONNECTION FAIL");
	}
		
?>