<?php
    session_start();
	$pkg = $_GET['PackageId'];
    if (!isset($_SESSION['loggedin']))
	{
	    $_SESSION['pagename']="bookings.php";
        $message = "<h4 style='text-align: center;'>Please log in.</h4><br>";
	    header("Location: registration.php?PackageId=$pkg");
	}
	$link = mysqli_connect("localhost","root","","travelexperts") or die("Connection Error: " . mysqli_error());
	$cust_email = $_SESSION['cust_email'];
	$sql = "select * from customers where CustEmail = '$cust_email'";
	$result = mysqli_query($link,$sql);
	while ($row1 = mysqli_fetch_array($result)) {
        extract($row1);          // extract() will assign each row as a variable
    }
	
    $title = "Home";
    $display = "Package Booking";
    $slider = "03";
    
    
    // This $sql will select the package information based on the GET variable passed from the Packages page.
    $sql = "select PkgName,PkgStartDate,PkgEndDate,PkgDesc,PkgBasePrice from Packages where PackageId='$pkg'"; 
    $result = mysqli_query($link,$sql);
    while ($row = mysqli_fetch_array($result)) {
        extract($row);          // extract() will assign each row as a variable, ie. $PkgName
    }
    

    mysqli_close($link);

    include('header.php');
?>
<div class="container-fluid"> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id="body">
                <div class="row" style="width: 100;">
                    <span class="book_num"><strong>BOOKING NO:</strong> #012993</span><span class="book_print"><a href="#"><i class="fa fa-print"></i> &nbsp; <strong>Print Page</strong></a></span>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-7 bookings style" style="margin-right: 20px;">
                        <h3><i class="fa fa-suitcase"></i> &nbsp;<strong>Package Details</strong></h3>
                        <hr class="style-one">
                        <?php /*
                           $html = "<table border='1'><tr><td><h3><strong> Name </strong></h3></td>";
                           $html .= "<td><h3><strong> $PkgName </strong></h3></td></tr>";
                           $html .= "<tr><td><h3><strong> Star Date </strong></h3></td>";
                           $html .= "<td><h3><strong> $PkgStartDate </strong></h3></td></tr>";
                           $html .= "<tr><td><h3><strong> End Date </strong></h3></td>";
                           $html .= "<td><h3><strong> $PkgEndDate </strong></h3></td></tr>";
                           $html .= "<tr><td><h3><strong> Description </strong></h3></td>";
                           $html .= "<td><h3><strong> $PkgDesc </strong></h3></td></tr>";
                           $html .= "<tr><td><h3><strong> Base Price </strong></h3></td>";
                           $html .= "<td><h3><strong> $PkgBasePrice </strong></h3></td></tr></table>";
                           print($html);
            */ ?>
                        <div class="book_pkg_info">
                            <div class="book_pkg_title"><h2>Caribbean New Year</h2></div>
                            <div class="book_img"><img src="img/package01.jpg" class="img-responsive"></div>   
                            <div class="book_desc"><strong>Cruise the Caribbean &amp; Celebrate the New Year.</strong></div>
                            <div class="book_dates">
                                <table><tr>
                                    <th><strong>START DATE</strong></th>
                                    <th><strong>END DATE</strong></th>
                                    <th><strong>DURATION</strong></th>
                                </tr><tr>
                                    <td><h4><strong>Dec 20, 2005</strong></h4></td>
                                    <td><h4><strong>Dec 30, 2005</strong></h4></td>
                                    <td><h4><strong>10 Days</strong></h4></td>
                                </tr></table>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-4 customer style">
                        <h3><i class="fa fa-user"></i> &nbsp;<strong>Customer Details</strong></h3><hr class="style-one">
                        <img src="img/customer_profile.jpg" class="img-responsive" style="width: 300px; margin: 0 auto;"><br>
                        
                        <?php 
                           $html = "<table border='0' width='100%'><tr><td><h3><strong> $CustFirstName $CustLastName </strong></h3></td></tr>";

                           $html .= "<tr><td><strong> $CustAddress </strong></td></tr>";

                           $html .= "<tr><td><strong> $CustCity, $CustProv  $CustCountry </strong></td></tr>";

                           $html .= "<tr><td><strong> $CustPostal </strong></td></tr>";

                           $html .= "<tr><td><strong> $CustHomePhone</strong></td></tr>";
                           $html .= "<tr><td><strong> $CustBusPhone</strong></td></tr></table>";
                           print($html);
                        ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-7 payment style">
                        <h3><i class="fa fa-credit-card"></i> &nbsp;<strong>Billing Information</strong></h3> 
                        <hr class="style-one">
                        <p>Please enter your payment details below.</p><br>
                        <form class="form-horizontal" role="form">
                          <div class="form-group">
                            <label class="col-sm-4 control-label">Credit Card Type</label>
                            <div class="col-sm-8">
                              <div class="col-sm-3">
                                  <label class="radio-inline">
                                    <input type="radio" name="paymentmethod" id="visa" value="Visa" checked> <i class="fa fa-cc-visa fa-2x"></i>
                                  </label>
                                </div>
                                <div class="col-sm-3">
                                  <label class="radio-inline">
                                    <input type="radio" name="paymentmethod" id="mastercard" value="Mastercard"> <i class="fa fa-cc-mastercard fa-2x"></i>
                                  </label>
                                </div>
                                <div class="col-sm-3">
                                  <label class="radio-inline">
                                    <input type="radio" name="paymentmethod" id="amex" value="American Express"> <i class="fa fa-cc-amex fa-2x"></i></i>
                                  </label>
                                </div>
                              <div class="col-sm-3">
                                  <label class="radio-inline">
                                    <input type="radio" name="paymentmethod" id="discover" value="Discover"> <i class="fa fa-cc-discover fa-2x"></i></i></i>
                                  </label>
                                </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-4 control-label">Credit Card Number</label>
                            <div class="col-xs-6 col-sm-4">
                              <input type="text" class="form-control" id="cardnumber" placeholder="Enter your credit card" size="16" maxlength="16">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-4 control-label">Expiration Date</label>
                            <div class="col-xs-4 col-sm-3" style="margin-right: -14px;">
                              <select name="expirymonth" class="form-control">
                                  <option value="">Month</option>
                                  <option value="January">01</option>
                                  <option value="February">02</option>
                                  <option value="March">03</option>
                                  <option value="April">04</option>
                                  <option value="May">05</option>
                                  <option value="June">06</option>
                                  <option value="July">07</option>
                                  <option value="August">08</option>
                                  <option value="September">09</option>
                                  <option value="October">10</option>
                                  <option value="November">11</option>
                                  <option value="December">12</option>
                              </select>
                            </div>
                              <div class="col-xs-4 col-sm-3" style="margin-right: -14px;">
                              <select name="expiryyear" class="form-control">
                                  <option value="">Year</option>
                                  <option value="2014">2014</option>
                                  <option value="2015">2015</option>
                                  <option value="2016">2016</option>
                                  <option value="2017">2017</option>
                                  <option value="2018">2018</option>
                                  <option value="2019">2019</option>
                                  <option value="2020">2020</option>
                                  <option value="2021">2021</option>
                                  <option value="2022">2022</option>
                                  <option value="2023">2023</option>
                              </select>
                            </div>
                              <div class="col-xs-4 col-sm-2">
                                  <input type="text" class="form-control" id="cvv" placeholder="CVV Code" size="3" maxlength="3">
                              </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-4 control-label">Name on Card</label>
                            <div class="col-xs-6 col-sm-4" style="margin-right: -14px;">
                              <input type="text" class="form-control" id="firstname" placeholder="First Name">
                            </div>
                              <div class="col-xs-6 col-sm-4" >
                                  <input type="text" class="form-control" id="lastname" placeholder="Last Name">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-offset-4  col-sm-8 checkbox-inline">
                                &nbsp; &nbsp; <input type="checkbox" id="billing" value="billing"> Use personal information as Billing Address? 
                            </label>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-10">
                              <button type="submit" class="btn btn-default">SUBMIT</button>
                            </div>
                          </div>
                        </form>

                    </div>
                    <div class="col-xs-6 col-sm-5 payment">
                        <br><img src="img/nortonseal.png" style="height: 80px;"><br><br><img src="img/verisignseal.jpg" style="height: 80px;"><br><br><img src="img/securityseal01.jpg" style="height: 80px;">
                    </div>
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        </div>
<?php
    include("footer.php");
?>