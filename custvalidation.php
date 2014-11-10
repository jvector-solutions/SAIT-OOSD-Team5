<?php

	include("custdata.php");
	
	if(isset($_REQUEST['CustFirstName']))
	{
		$message = "";
		if(isset($_REQUEST['CustFirstName']))
		{
			$message .="FirstName must have valid name<br />";
		}
		else
		{
			if(!preg_match("/^[a-z]+$/i",$_REQUEST['CustFirstName']))
			{
				$message .="Invalid Character in First Name";
			}
		}
		if(empty($_REQUEST['CustLastName']))
		{
			$message .="Last name must have value<br />";
		}
		else
		{
			if(!preg_match("/^[a-z]+$/i",$_REQUEST['CustLastName']))
			{
				$message .="Invalid character in Last name";
			}
		}
		if(empty($_REQUEST['CustAddress']))
		{
			$message .="Address Must have Value..";
		}
		else
		{
			if(!preg_match("/^[0-9 \s a-zA-Z]+$/",$_REQUEST['CustAddress']))
			{
				$message .="Invalid Address.."
			}
		}
		if(empty($_REQUEST['CustCity']))
		{
			$message .="City must have value<br />";
		}
		else
		{
			if(!preg_match("/^[a-z]+$/i",$_REQUEST['CustCity']))
			{
				$message .="Invalid character in City";
			}
		}
		if(empty($_REQUEST['CustProv']))
		{
			$message .="Province must have value<br />";
		}
		else
		{
			if(!preg_match("/^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/",$_REQUEST['CustProv']))
			{
				$message .="Invalid Province name..";
			}
		}
		if(empty($_REQUEST['CustPostal']))
		{
			$message .="Postal Code Must have valid value";
		}
		else
		{
			if(!preg_match("/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/",$_REQUEST['CustPostal']))
			{
				$message .="Invalid Postal Code";
			}
		}
		if(empty($_REQUEST['CustHomePhone']))
		{
			$message .="Home Phone Must have valid value";
		}
		else
		{
			if(!preg_match("/^([0-9]{3})[0-9]{3} - \d{4}/",$_REQUEST['CustHomePhone']))
			{
				$message .="Invalid Home Phone";
			}
		}
		if(empty($_REQUEST['CustBusPhone']))
		{
			$message .="Business Phone Must have valid value";
		}
		else
		{
			if(!preg_match("/^([0-9]{3})[0-9]{3} - \d{4}/",$_REQUEST['CustBusPhone']))
			{
				$message .="Invalid Business Phone";
			}
		}
		if(empty($_REQUEST['CustEmail']))
		{
			$message .="Email Must have proper format";
		}
		else
		{
			if(!preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/",$_REQUEST['CustEmail']))
			{
				$message .="Invalid Email Address..";
			}
		}
		if(!empty($message))
		{
			header("Location: customer.php");
		}
		else
		{
			$display = $insertCustomer($_REQUEST)
			if($display)
			{
				print("Thank you for Registration...");
			}
			else
			{
				print("There was a problem of inserted data..");
			}
		}
		
	}
?>