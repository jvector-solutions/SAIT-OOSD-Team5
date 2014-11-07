<?php
    $title = "Registration";
    $display = "Account";
    $slider = "02";
    include('header.php');
?>
        <div class="container-fluid"> <!--- Start of Container --->
            <!--- Main body begins here --->
            <div id="body">
                <div class="row">
                    <div class="style col-xs-8 col-sm-4" style="margin: 5px 10px;">
                        <h1>Login</h1><hr class="style-one">
                        <form name="login" method="post" class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="login_email" class="col-sm-4 control-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="login_email" required="" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_password" class="col-sm-4 control-label">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="login_password" required="" placeholder="Password">
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
                                    <button type="submit" class="btn btn-default">Sign in</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="style col-xs-11 col-sm-7" style="margin: 5px 10px;">
                        <h1>Registration</h1>
                        <hr class="style-one">
                        <br>
                        <form name="register" method="post" action="bouncer.php" class="form-horizontal" role="form" onsubmit=" return formvalidation()">
                        <div class="form-group">
	                       <label for="fname" class="col-sm-4 control-label">First Name</label>
	                       <div class="col-sm-8">
                                <input id="fname" name="fname" type="text" placeholder="First Name" tabindex="1" size="30" maxlength="30" class="form-control" onblur="validateName(value)">
								<span id="fnameError" style="display: none;">You can only use alphabetic characters, hyphens and apostrophes</span>
                           </div>
                        </div>
                        <div class="form-group">    
	                       <label for="lname" class="col-sm-4 control-label">Last Name</label>
                            <div class="col-sm-8">
                                <input id="lname" name="lname" type="text" placeholder="Last Name" tabindex="2" size="30" maxlength="30" class="form-control" onblur="validateLname(value)">
								<span id="lnameError" style="display: none;">You can only use alphabetic characters, hyphens and apostrophes</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-4 control-label">Email or Username</label>
                            <div class="col-sm-8">
                                <input id="email" name="email" type="email" placeholder="example: ab@yahoo.com" tabindex="3" size="30" maxlength="30" class="form-control" onblur="validateEmail(value)">
								<span id="emailerror" style="display: none;">You must enter valid Email address</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-4 control-label">Create a password</label>
                            <div class="col-sm-8">
                                <input id="password" type="password" name="password" tabindex="4" size="30" maxlength="30" class="form-control">
								<span id ="passworderror"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="repassword" class="col-sm-4 control-label">Confirm password</label>
                            <div class="col-sm-8">
                                <input id="repassword" type="password" name="repassword"  tabindex="5" size="30" maxlength="30" class="form-control">
								<span id="repassworderror"></span>
                            </div>
                        </div>
                            <hr>
                        <div class="form-group">
                            <label for="add1" class="col-sm-4 control-label">Address</label>
                            <div class="col-sm-8">
                                <input id="add1" name="add1" type="text" placeholder="Street 1" tabindex="6" size="30" maxlength="30" class="form-control" onblur="validateAddress(value)">
								<span id="addresserror" style="display: none;">You must enter valid address...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add2" class="col-sm-4 control-label"></label>
                            <div class="col-sm-8">
                                <input id="add2" name="add2" type="text" placeholder="Street 2" tabindex="7" size="30" maxlength="30" class="form-control" onblur="validateAddress1(value)">
								<span id="address2error" style="display: none;">You must enter valid address...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-4 control-label">City</label>
                            <div class="col-sm-8">
                                <input id="city" name="city" type="text" placeholder="City" tabindex="8" class="form-control" onblur="validateCity(value)">
								<span id="cityerror" style="display: none;">You must enter city...</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="province" class="col-sm-4 control-label">Province</label>
                            <div class="col-sm-8">
                                <input  id= "province" name="province" type="text" placeholder="Province" tabindex="9" class="form-control">
								<span id="proverror" style="display: none;">You must enter province...</span>
                           </div>
                        </div>
                        <div class="form-group">
                            <label for="country" class="col-sm-4 control-label">Country</label>
                            <div class="col-sm-8">
                                <input type="text" name="country"  size="30" list="countries" tabindex="10" placeholder="select one.." class="form-control">
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
                            <div class="col-sm-8">
                                <input name="postal" type="text" placeholder="Postal Code" tabindex="11" class="form-control">
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label for="phone" class="col-sm-4 control-label">Phone Number</label>
                            <div class="col-sm-8">
                                <input name="phone" type="text" placeholder="(555) 555-5555" tabindex="12" class="form-control">
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
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>