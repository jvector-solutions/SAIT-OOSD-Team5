<!-- Written by Megha //-->
 
<?php
    session_start();
	include("functions.php");
	if(isset($_POST['CustFirstName'])) {
		$message = "";
		if(empty($_POST['CustFirstName'])) {
			$message .="First Name must have a value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustFirstName'])) {
            $message .="Invalid Character in First Name";
		}
        
		if(empty($_POST['CustLastName'])) {
			$message .="Last Name must have a value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustLastName'])) {
            $message .="Invalid character in Last name";
		}
        
		if(empty($_POST['CustAddress'])) {
			$message .="Address must have a value.<br>";
		} else if($_POST['CustAddress'] == "") {
            $message .="Enter an address.";
		}
        
		if(empty($_POST['CustCity'])) {
			$message .="City must have value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustCity'])) {
            $message .="Invalid character in City";
		}

		if(empty($_POST['CustProv'])) {
			$message .="Province must have a value.<br>";
		} else if(!preg_match("/^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/",$_POST['CustProv'])) {
            $message .="Invalid Province name..";
		}

		if(empty($_POST['CustPostal'])) {
			$message .="Postal Code must have valid format.<br>";
		} else if(!preg_match("/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/",$_POST['CustPostal'])) {
            $message .="Invalid Postal Code";
		}

		if(empty($_POST['CustHomePhone'])) {
			$message .="Home Phone must have valid value.<br>";
		} else if(!preg_match("/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/",$_POST['CustHomePhone'])) {
            $message .="Invalid Home Phone";
		}

		if(empty($_POST['CustBusPhone'])) {
			$message .="Business Phone must have valid value.<br>";
		} else if(!preg_match("/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/",$_POST['CustBusPhone'])) {
            $message .="Invalid Business Phone";
		}
        
		if(empty($_POST['CustEmail'])) {
			$message .="Email must have proper format.<br>";
		} else if(!preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/",$_POST['CustEmail'])) {
            $message .="Invalid Email Address..";
		}
        
		if(!empty($message)) {
            print("There was a problem.<br>$message");
			header("Location: registration.php");
		} else {
			$result = insertCustomer($_POST);
            $_SESSION['loggedin'] = true;
            $_SESSION['cust_email'] = trim($_POST['CustEmail']);
			if($result) {
				print("Thank you for registering!");
                header("Location: customer.php");
			}
		}
	}
?>