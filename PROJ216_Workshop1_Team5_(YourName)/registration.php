<!-- registration.php page 
Author Name: Megha Patel
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying a static form for the registration page with lots of JavaScript and PHP functionality to validate the forms (both client and server-side) and to store form field and login field information in the database.
//-->


<?php
    include("functions.php");
    session_start();
    $title = "Registration";
    $display = "Login or Register";
    $slider = "02";
        
    // Login Functions written by Megha, Brian and John 
    if (!isset($_SESSION['loggedin'])) {
        $message="<h4 style='text-align: center;'>Please log in.</h4><br>";
        if (isset($_POST['login_email'])) {
            if (verifyLogin($_POST['login_email'], $_POST['login_pass'])) {
                // Set session variable
                $_SESSION['loggedin'] = true;
                $_SESSION['cust_email'] = trim($_POST['login_email']);
                $pagename = (isset($_SESSION['pagename']) ? $_SESSION['pagename'] : null);
                $PackageId = (isset($_GET['PackageId']) ? $_GET['PackageId'] : null);
                if (isset($_GET['PackageId'])) {
                    header("Location: $pagename?PackageId=$PackageId");
                } else {
                    $message = "<h4 style='color: green; text-align: center;'><i class='fa fa-exclamation-triangle'></i> You are successfully logged in.</h4><br>";
                    header("Location: customer.php");
                }
            } else {
                // Set Login Error Message
                $message = "<h4 style='color: #e35152; text-align: center;'><i class='fa fa-exclamation-triangle'></i> Incorrect Email or Password.</h4><br>";
            }
        } else if (isset($_POST['CustEmail'])) {
            $_SESSION['cust_email'] = trim($_POST['CustEmail']);
        }
    }
    
    // Customer information with php validation function written by Megha
    if(isset($_POST['CustFirstName'])) {
		$phpmessage = "";
		if(empty($_POST['CustFirstName'])) {   
			$phpmessage .="First Name must have a value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustFirstName'])) {
            $phpmessage .="Invalid Character in First Name";
		}
        
		if(empty($_POST['CustLastName'])) {
			$phpmessage .="Last Name must have a value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustLastName'])) {
            $phpmessage .="Invalid character in Last name";
		}
        
		if(empty($_POST['CustAddress'])) {
			$phpmessage .="Address must have a value.<br>";
		} else if($_POST['CustAddress'] == "") {
            $phpmessage .="Enter an address.";
		}
        
		if(empty($_POST['CustCity'])) {
			$phpmessage .="City must have value.<br>";
		} else if(!preg_match("/^[a-z]+$/i",$_POST['CustCity'])) {
            $phpmessage .="Invalid character in City";
		}

		if(empty($_POST['CustProv'])) {
			$phpmessage .="Province must have a value.<br>";
		} else if(!preg_match("/^[?:AB|BC|MB|N[BLTSU]|ON|PE|QC|SK|YT]$/",$_POST['CustProv'])) {
            $phpmessage .="Invalid Province name..";
		}

		if(empty($_POST['CustPostal'])) {
			$phpmessage .="Postal Code must have valid format.<br>";
		} else if(!preg_match("/^([A-Z][0-9][A-Za-z] [0-9][A-Z][0-9])$/",$_POST['CustPostal'])) {
            $phpmessage .="Invalid Postal Code";
		}

		if(empty($_POST['CustHomePhone'])) {
			$phpmessage .="Home Phone must have valid value.<br>";
		} else if(!preg_match("/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/",$_POST['CustHomePhone'])) {
            $phpmessage .="Invalid Home Phone";
		}

		if(empty($_POST['CustBusPhone'])) {
			$phpmessage .="Business Phone must have valid value.<br>";
		} else if(!preg_match("/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/",$_POST['CustBusPhone'])) {
            $phpmessage .="Invalid Business Phone";
		}
        
		if(empty($_POST['CustEmail'])) {
			$phpmessage .="Email must have proper format.<br>";
		} else if(!preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/",$_POST['CustEmail'])) {
            $phpmessage .="Invalid Email Address..";
		}
 
		// This function will be called if any wrong information is entered into the form
		if(empty($phpmessage)) {  // Otherwise it will insert the customer into the database and bring the customer to the customer page
			$result = insertCustomer($_POST);
            $_SESSION['loggedin'] = true;
            $_SESSION['cust_email'] = trim($_POST['CustEmail']);
			if($result) {
                header("Location: customer.php");
			}
		}
	}

    include("header.php");
?>
        <!-- Form HTML and JavaScript validation written by Megha //-->

        <div class="container-fluid"> <!--- Start of Container --->
            <!--- Main Body begins here --->
            <div id="body">
                <div class="row">
                    <div class="style col-xs-11 col-sm-4" style="margin: 5px 10px;">
                        <!-- BEGIN Login Form //-->
                        <h1><i class="fa fa-sign-in"></i> Login</h1><hr class="style-one">
                        <?php
                            if (isset($message)) {
                                print("$message");	// It displays a message when the user does not put in their proper login information
                            }
                        ?>
						<!-- this from access from user table -->
                        <form name="login" method="post" class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="login_email" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="text" name="login_email" class="form-control" id="login_email" required="" placeholder="Email Address">
									<span id="loginemailError" style="display:none">You must enter your Email address.</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_password" class="col-sm-4 control-label">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" name="login_pass" class="form-control" id="login_password" required="" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12" style="text-align: center;">
                                    <button type="submit" class="btn btn-primary">Sign in and Continue</button>
                                    <p style="margin: 15px 0 -15px 0; color: rgba(47, 115, 193, 1); text-decoration: underline; "><a href="forgot_pass.php">Forgot password?</a></p>
                                </div>
                            </div>
                        </form><br>
                        <!-- END Login Form //-->
                        <?php
                            if (isset($phpmessage)) {
                                print("<hr class='style-one'>");
                                print("<h2 style='color: #e35152';><i class='fa fa-exclamation-triangle'></i> WARNING</h2>");
                                print("<span style='color: #e35152;'><em>$phpmessage</em></span>");	// It displays a message when the user does not put in their proper registration information
                            }
                        ?>
                    </div>
                    <div class="style col-xs-11 col-sm-7" style="margin: 5px 10px;">
                        <h1><i class="fa fa-pencil-square-o"></i> Create an Account</h1>
                        <hr class="style-one">
                        <h4>Please enter your personal information.</h4><br>
                        
                        <!-- BEGIN Registration Form //-->
                        <form name="register" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>" class="form-horizontal" role="form" onsubmit="return formvalidation()">
                        <div class="form-group">
	                       <label for="fname" class="col-sm-4 control-label">First Name</label>
	                       <div class="col-sm-8">
                                <input id="fname" name="CustFirstName" type="text" placeholder="First Name" tabindex="1" size="30" maxlength="30" class="form-control" onblur="validateFname(value)">
								<span id="fnameError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You can only use alphabetic characters.</span>
                           </div>
                        </div>
                        <div class="form-group">    
	                       <label for="lname" class="col-sm-4 control-label">Last Name</label>
                            <div class="col-sm-8">
                                <input id="lname" name="CustLastName" type="text" placeholder="Last Name" tabindex="2" size="30" maxlength="30" class="form-control" onblur="validateLname(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="lnameError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You can only use alphabetic characters.</span>
                            </div>
                        </div> <!-- login information inside registration form -->
                        <div class="form-group"> <!-- this data stored in user information database -->
                            <label for="email" class="col-sm-4 control-label">Email or Username</label> 
                            <div class="col-sm-8"> 
                                <input id="email" name="CustEmail" type="email" placeholder="example: ab@yahoo.com" tabindex="3" size="30" maxlength="30" class="form-control" onblur="validateEmail(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="emailError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i>You must enter a valid Email address.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-4 control-label">Create a password</label>
                            <div class="col-sm-8">
                                <input id="password1" type="password" name="password1" tabindex="4" size="30" maxlength="30" class="form-control" onblur="validatePassword1(value)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-4 control-label">Confirm password</label>
                            <div class="col-sm-8">
                                <input id="password2" type="password" name="password2"  tabindex="5" size="30" maxlength="30" class="form-control" onblur="validatePassword2(value); comparePasswords();">
                                <div id="passwordError" style="font-size: 12px; margin-top: 10px;">Your password must be at least six characters and contain at least one number, one lowercase, one uppercase letter.</div>
                            </div>
                        </div>
                        <hr class="style-one">  <!--this information stored in customer table -->
                        <h4>Please enter your contact information.</h4><br>
                        <div class="form-group">
                            <label for="add1" class="col-sm-4 control-label">Address</label>
                            <div class="col-sm-8">
                                <input id="add1" name="CustAddress" type="text" placeholder="Address" tabindex="6" size="30" maxlength="30" class="form-control" onblur="validateAddress(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="addressError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter an address.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-4 control-label">City</label>
                            <div class="col-sm-8">
                                <input id="city" name="CustCity" type="text" placeholder="City" tabindex="8" class="form-control" onblur="validateCity(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="cityError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter a city.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-4 control-label">Province</label>
                            <div class="col-sm-2">
                                <input  id= "province" name="CustProv" type="text" placeholder="Province" tabindex="9" class="form-control" size="2" maxlength="2" onblur="validateProv(value)">
                           </div>
                            <div class="col-sm-offset-4 col-sm-6">
                            <span id="provError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter a valid province or state.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="countries" class="col-sm-4 control-label">Country</label>
                            <div class="col-sm-4">
                                <input type="text" name="CustCountry"  size="30" list="countries" tabindex="10" placeholder="Select Country" class="form-control">
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
                            <label for="postal" class="col-sm-4 control-label">Postal Code</label>
                            <div class="col-sm-4">
                                <input id="postal" name="CustPostal" type="text" placeholder="Postal Code" tabindex="11" class="form-control" maxlength="7" onblur="validatePostal(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="postalError" style="display: none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter a valid Postal Code.</span>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="homephone" class="col-sm-4 control-label">Home Phone</label>
                            <div class="col-sm-4">
                                <input id="homephone" name="CustHomePhone" type="text" placeholder="(555) 555-5555" tabindex="12" class="form-control" onblur="validateHomePhone(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="homephoneError" style="display:none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter a valid phone number.</span>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="busphone" class="col-sm-4 control-label">Business Phone</label>
                            <div class="col-sm-4">
                                <input id="busphone" name="CustBusPhone" type="text" placeholder="(555) 555-5555" tabindex="12" class="form-control" onblur="validateBusPhone(value)">
                            </div>
                            <div class="col-sm-offset-4 col-sm-6">
                                <span id="busphoneError" style="display:none;"> <i class='fa fa-exclamation-triangle' style='color: #e35152'></i> You must enter a valid phone number.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                            </div>
                        </div>
                        </form>
                        <!-- END Registration Form //-->
                    </div>
                </div>
            </div> <!--- End of Body --->
        </div> <!-- End of Container -->
<?php
    include("footer.php");
?>