<?php
    $title = "Registration";
    $display = "Login or Register";
    $slider = "02";

    // Written by John
    function verifyLogin($u,$p) {
        $link = mysqli_connect("localhost","root","","travelexperts") or die("Error: " . mysqli_connect_error());
        $sql = "SELECT password FROM users WHERE userid='$u'";
        $result = mysqli_query($link, $sql) or die("SQL Error:" . mysqli_error());
        if ($pwd = mysqli_fetch_row($result)) {
            if ($pwd[0] == $p) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
        mysqli_close($link);
    }

    // Login Functions
    session_start();
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
                    //header("Location: registration.php");
                } else {
                    $message = "<h4 style='color: green; text-align: center;'><i class='fa fa-exclamation-triangle'></i> You are successfully logged in.</h4><br>";
                }
            } else {
                // Set Login Error Message
                $message = "<h4 style='color: red; text-align: center;'><i class='fa fa-exclamation-triangle'></i> Incorrect Email or Password.</h4><br>";
            }
        }
    }
include("header.php");
?>
        <div class="container-fluid"> <!--- Start of Container --->
            <!--- Main body begins here --->
            <div id="body">
                <div class="row">
                    <div class="style col-xs-11 col-sm-4" style="margin: 5px 10px;">
                        <!-- BEGIN Login Form //-->
                        <h1><i class="fa fa-sign-in"></i> Login</h1><hr class="style-one">
                        <?php
                            if (isset($message)) {
                                print("$message");
                            }
                        ?>
                        <form name="login" method="post" class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="login_email" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="text" name="login_email" class="form-control" id="login_email" required="" placeholder="Enter login email address">
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
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-default">Sign in</button>
                                </div>
                            </div>
                        </form>
                        <!-- END Login Form //-->
                    </div>
                    
                    <div class="style col-xs-11 col-sm-7" style="margin: 5px 10px;">
                        <h1><i class="fa fa-pencil-square-o"></i> Create an Account</h1>
                        <hr class="style-one">
                        <h4>Please enter your personal information.*</h4><br>
                        <!-- BEGIN Registration Form //-->
                        <form name="register" method="post" action="customer.php" class="form-horizontal" role="form" onsubmit="return formvalidation()">
                        <div class="form-group">
	                       <label for="fname" class="col-sm-4 control-label">First Name</label>
	                       <div class="col-sm-8">
                                <input id="fname" name="CustFirstName" type="text" placeholder="First Name" tabindex="1" size="30" maxlength="30" class="form-control" onblur="validateFname(value)">
								<span id="fnameError" style="display: none;">You can only use alphabetic characters.</span>
                           </div>
                        </div>
                        <div class="form-group">    
	                       <label for="lname" class="col-sm-4 control-label">Last Name</label>
                            <div class="col-sm-8">
                                <input id="lname" name="CustLastName" type="text" placeholder="Last Name" tabindex="2" size="30" maxlength="30" class="form-control" onblur="validateLname(value)">
								<span id="lnameError" style="display: none;">You can only use alphabetic characters.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-4 control-label">Email or Username</label>
                            <div class="col-sm-8">
                                <input id="email" name="CustEmail" type="email" placeholder="example: ab@yahoo.com" tabindex="3" size="30" maxlength="30" class="form-control" onblur="validateEmail(value)">
								<span id="emailError" style="display: none;">You must enter valid Email address</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password1" class="col-sm-4 control-label">Create a password</label>
                            <div class="col-sm-8">
                                <input id="password1" type="password" name="password1" tabindex="4" size="30" maxlength="30" class="form-control">
								<span id ="password1Error"  style="color:#ccffcc"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-4 control-label">Confirm password</label>
                            <div class="col-sm-8">
                                <input id="password2" type="password" name="password2"  tabindex="5" size="30" maxlength="30" class="form-control">
								<span id="password2Error" style="color:#ccffcc"></span>
                                <span style="font-size: 0.8em;">Your password must be at least six characters and contain at least one number, one lowercase, one uppercase letter.</span>
                            </div>
                        </div>
                        <hr class="style-one">
                        <h4>Please enter your contact information.</h4><br>
                        <div class="form-group">
                            <label for="add1" class="col-sm-4 control-label">Address</label>
                            <div class="col-sm-8">
                                <input id="add1" name="CustAddress" type="text" placeholder="Address" tabindex="6" size="30" maxlength="30" class="form-control" onblur="validateAddress(value)">
								<span id="addressError" style="display: none;">You must enter an address...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-4 control-label">City</label>
                            <div class="col-sm-8">
                                <input id="city" name="CustCity" type="text" placeholder="City" tabindex="8" class="form-control" onblur="validateCity(value)">
								<span id="cityError" style="display: none;">You must enter city...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-4 control-label">Province</label>
                            <div class="col-sm-2">
                                <input  id= "province" name="CustProv" type="text" placeholder="Province" tabindex="9" class="form-control" size="2" maxlength="2" onblur="validateProv(value)">
								<span id="provError" style="display: none;">You must enter first two digit of province...</span>
                           </div>
                        </div>
                        <div class="form-group">
                            <label for="countries" class="col-sm-4 control-label">Country</label>
                            <div class="col-sm-4">
                                <input type="text" name="CustCountry"  size="30" list="countries" tabindex="10" placeholder="select one.." class="form-control">
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
                                <input id="postal" name="CustPostal" type="text" placeholder="Postal Code" tabindex="11" class="form-control" onblur="validatePostal(value)">
								<span id="postalError" style="display: none;">You must enter Postal code</span>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="homephone" class="col-sm-4 control-label">Home Phone</label>
                            <div class="col-sm-4">
                                <input id="homephone" name="CustHomePhone" type="text" placeholder="(555) 555-5555" tabindex="12" class="form-control" onblur="validatePhone(value)">
								<span id="homephoneError" style="display:none;">You must enter valid phone number</span>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="busphone" class="col-sm-4 control-label">Business Phone</label>
                            <div class="col-sm-4">
                                <input id="busphone" name="CustBusPhone" type="text" placeholder="(555) 555-5555" tabindex="12" class="form-control" onblur="validatePhone(value)">
								<span id="busphoneError" style="display:none;">You must enter valid phone number</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="submit" class="btn btn-default" name="submit">Submit</button>
                            </div>
                        </div>
                        </form>
                        <!-- END Registration Form //-->
                    </div>
                </div>
            </div> <!--- End of body --->
        </div> <!-- End of Container -->
<?php
    include("footer.php");
?>