<?php
function insertCustomer($test)
{
	$sql = "INSERT INTO customers values
	(NULL,'$test[CustFirstName]',
			'$test[CustLastName]',
			'$test[CustAddress]',
			'$test[CustCity]',
			'$test[CustProv]',
			'$test[CustPostal]',
			'$test[CustCountry]',
			'$test[CustHomePhone]',
			'$test[CustBusPhone]',
			'$test[CustEmail]',
			 $test[AgentId])";
	//create connection
	$con = mysqli_connect("localhost","root","","travelexperts") or 
		                     die("Error: " .mysqli_connect_error());
	//check connection
	$display = mysqli_query($con , $sql) or 
			                 die("query Error:" .mysqli_error($con));
	mysqli_close($con);
	return $display;
}	
?>