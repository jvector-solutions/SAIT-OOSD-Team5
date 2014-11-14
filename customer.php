<?php
	$title = "Customer";
    $display = "Your Profile";
	$slider = "05";
    include('header.php');

    // Written by Megha
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
			// header("Location: customer.php");
		} else {
			$result = insertCustomer($_POST);
			if($result) {
				print("Thank you for registering!");
                print($result);
			}
		}
	}

?>
        <div class="container-fluid"> <!--- Start of Container --->
            <!--- Main body begins here --->
            <div id="body">
                <div class="row">
                    <div class="style col-xs-8 col-sm-4" style="margin: 5px 10px;">
                        <h1><i class="fa fa-sign-in"></i> Login</h1><hr class="style-one">
                        <form name="login" method="post" class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="login_email" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input id="loginemail" type="loginemail" class="form-control" id="login_email" placeholder="Enter a valid Email address">
									<span id="loginemailError" style="display:none">You must enter User name</span>
									
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_password" class="col-sm-4 control-label">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="login_password" placeholder="Password">
                                </div>
                            </div>
							<div class="form-group">
                                <label for="login_conpass" class="col-sm-4 control-label">Confirm Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="login_conpass" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <div class="checkbox">
                                        <label><input type="checkbox"> Remember me</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-default" name="submit">Sign in</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="style col-xs-11 col-sm-7" style="margin: 5px 10px;">
                        <h1><i class="fa fa-pencil-square-o"></i> Customer Information</h1>
                        <hr class="style-one">
                        <br>
                        <form name="custform" method="post" action="" class="form-horizontal" role="form">
                        <div class="form-group">
	                       <label for="fname" class="col-sm-4 control-label">First Name</label>
	                       <div class="col-sm-8">
                                <input id="fname" name="fname" type="text" placeholder="First Name" tabindex="1" size="30" maxlength="30" class="form-control">
								<!--<span id="fnameError" style="display: none;">You can only use alphabetic characters.</span> -->
                           </div>
                        </div>
                        <div class="form-group">    
	                       <label for="lname" class="col-sm-4 control-label">Last Name</label>
                            <div class="col-sm-8">
                                <input id="lname" name="lname" type="text" placeholder="Last Name" tabindex="2" size="30" maxlength="30" class="form-control">
								<!--<span id="lnameError" style="display: none;">You can only use alphabetic characters.</span> -->
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="add1" class="col-sm-4 control-label">Address</label>
                            <div class="col-sm-8">
                                <input id="address" name="address" type="text" placeholder="Address" tabindex="3" size="30" maxlength="30" class="form-control">
								<!--<span id="addressError" style="display: none;">You must enter valid address...</span>-->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-4 control-label">City</label>
                            <div class="col-sm-8">
                                <input id="city" name="city" type="text" placeholder="City" tabindex="4" class="form-control">
								<!--<span id="cityError" style="display: none;">You must enter city...</span>-->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-4 control-label">Province</label>
                            <div class="col-sm-8">
                                <input  id= "province" name="province" type="text" placeholder="Province" tabindex="5" class="form-control">
								<!--<span id="provError" style="display: none;">You must enter first two digit of province...</span>-->
                           </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="postal" class="col-sm-4 control-label">Postal Code</label>
                            <div class="col-sm-8">
                                <input id="postal" name="postal" type="text" placeholder="Postal Code" tabindex="6" class="form-control">
								<!--<span id="postalError" style="display: none;">You must enter Postal code</span>-->
                            </div>
                        </div>
						<div class="form-group">
                            <label for="country" class="col-sm-4 control-label">Country</label>
                            <div class="col-sm-8">
                                <input type="text" name="country"  size="30" list="countries" tabindex="7" placeholder="select one.." class="form-control">
                                <datalist id="countries">
                                    <option value="Australia">
                                    <option value="Canada">
                                    <option value="Germany">
                                    <option value="France">
                                    <option value="United Kingdom">
                                    <option value="United States">
                                </datalist>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="hp" class="col-sm-4 control-label">Home Number</label>
                            <div class="col-sm-8">
                                <input id="hp" name="hp" type="text" placeholder="(555) 555-5555" tabindex="8" class="form-control">
								<!--<span id="phoneError" style="display:none;">You must enter valid phone number</span>-->
                            </div>
                        </div>
						<div class="form-group"> 
                            <label for="busp" class="col-sm-4 control-label">Business Number</label>
                            <div class="col-sm-8">
                                <input id="busp" name="busp" type="text" placeholder="(555) 555-5555" tabindex="9" class="form-control">
								<!--<span id="phoneError" style="display:none;">You must enter valid phone number</span>-->
                            </div>
                        </div>
						<div class="form-group">
                            <label for="email" class="col-sm-4 control-label">Email or Username</label>
                            <div class="col-sm-8">
                                <input id="email" name="email" type="email" placeholder="example: ab@yahoo.com" tabindex="10" size="30" maxlength="30" class="form-control">
								<!--<span id="emailError" style="display: none;">You must enter valid Email address</span>-->
                            </div>
                        </div>
						<div class="form-group">
                            <label for="agid" class="col-sm-4 control-label">AgentId</label>
                            <div class="col-sm-8">
                                <input id="agid" name="agid" type="text" placeholder="Enter any one value(1 or 2)" tabindex="11" size="30" maxlength="30" class="form-control">
								<!--<span id="emailError" style="display: none;">You must enter valid Email address</span>-->
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="submit" class="btn btn-default" name="submit">Submit</button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div> <!--- End of body --->
        </div> <!-- End of Container -->
<?php
    include("footer.php");
?>