<!-- bookings.php page 
Author Name: John Nguyen & Brian Peng
Creation Date: November 13th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic information for the booking that uses the GET parameter from the packages page, displays the user contact information, and includes a payment form.
//-->

<?php
    include("functions.php");
    session_start();
	$pkg = $_GET['PackageId'];
    $newBookingNo = bookingNumber(3,3);
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
    $display = "Vacation Packages <i class='fa fa-angle-double-right'></i> Booking";
    $slider = "05";
    $BookingId="";
    $GST=0;
    
    
    // This $sql will select the package information based on the GET variable passed from the Packages page.
    $sql = "select PkgName,PkgStartDate,PkgEndDate,PkgDesc,PkgBasePrice from Packages where PackageId='$pkg'"; 
    $result = mysqli_query($link,$sql);
    while ($row = mysqli_fetch_array($result)) {
        extract($row);          // extract() will assign each row as a variable, ie. $PkgName
    }
    
    mysqli_close($link);
    include('header.php');
    echo "
    <!-- Written by John Nguyen //-->
    <script type='text/javascript'>
    var price=".sprintf('%d',$PkgBasePrice).";
    function calcPrice() {
        var guests = document.getElementById('packageCost').value;
        var subTotal = price*guests;
        document.getElementById('getSubtotal').innerHTML = subTotal.toFixed(2);
        document.getElementById('getGST').innerHTML = (subTotal*0.05).toFixed(2);
        document.getElementById('getTotal').innerHTML = (subTotal*1.05).toFixed(2);
    }
    </script>
<div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id='body'>
                <div class='row' style='width: 100;'>
                    <span class='book_num'><i class='fa fa-tag'></i> &nbsp;<strong>BOOKING NO:</strong> <span class='book_booking'>$newBookingNo</span></span><span class='book_print'><a href='#print'><i class='fa fa-print'></i> &nbsp; <strong>Print Page</strong></a></span>
                </div>
                <div class='row'>
                    <div class='col-xs-12 col-sm-7 bookings style' style='margin-right: 20px;'>
                        <h3><i class='fa fa-suitcase'></i> &nbsp;<strong>Package Details</strong></h3>
                        <hr class='style-one'>
                        <div class='book_pkg_info'>
                            <div class='book_pkg_title'><h2>$PkgName</h2></div>
                            <div class='book_img'><img src='img/package$pkg.jpg' class='img-responsive'></div>
                            <div class='book_desc'>$PkgDesc</div>
                            <div class='book_dates'>
                                <table class='details'><tr>
                                    <th><strong>START DATE</strong></th>
                                    <th><strong>END DATE</strong></th>
                                    <th><strong>DURATION</strong></th>
                                </tr>
                                <tr>
                                    <td><h4><strong>".date('M d, Y',strtotime($PkgStartDate))."</strong></h4></td>
                                    <td><h4><strong>".date('M d, Y',strtotime($PkgEndDate))."</strong></h4></td>
                                    <td><h4><strong>".floor((strtotime($PkgEndDate)-strtotime($PkgStartDate))/(60*60*24))." Nights</strong></h4></td>
                                </tr></table>
                                <table class='price'><tr>
                                    <th><strong>PACKAGE PRICE</strong><br>(CAD $ / person)</th>
                                    <th width='80px'><strong>NO. OF GUESTS</strong></th>
                                    <th><strong>SUBTOTAL</strong><br>(CAD $)</th>
                                    <th><strong>GST</strong><br>(5%)</th>
                                    <th><strong>TOTAL PRICE</strong><br>(CAD $)</th>
                                </tr>
                                <tr>
                                    <td><h4><strong>$".sprintf('%d',$PkgBasePrice)."</strong></h4></td>
                                    <td>
                                        <select id='packageCost' class='form-control' onchange='calcPrice()'>
                                            <option value='1' selected>1</option>
                                            <option value='2'>2</option>
                                            <option value='3'>3</option>
                                            <option value='4'>4</option>  
                                            <option value='5'>5</option> 
                                            <option value='6'>6</option>
                                            <option value='7'>7</option> 
                                            <option value='8'>8</option> 
                                            <option value='9'>9</option> 
                                        </select>
                                    </td>
                                    <td><h4><strong>$<span id='getSubtotal'>".sprintf('%.2f',$PkgBasePrice)."</span></strong></h4></td>
                                    <td><h4><strong>$<span id='getGST'>".sprintf('%.2f',$PkgBasePrice*0.075)."</span></strong></h4></td>
                                    <td class='totalprice'><h4><strong>$<span id='getTotal'>".sprintf('%.2f',$PkgBasePrice*1.075)."</span></strong></h4></td>
                                </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class='col-xs-12 col-sm-4 customer style'>
                        <h3><i class='fa fa-user'></i> &nbsp;<strong>Customer Details</strong></h3><hr class='style-one'>
                        <img src='img/customer_profile.jpg' class='img-responsive' style='width: 300px; margin: 0 auto;'><br>
                        <table class='book_prof_add'>
                            <tr>
                                <td colspan='2'>
                                    <h3><strong>$CustFirstName $CustLastName</strong></h3>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan='3' style='vertical-align: top; text-align: center;'><i class='fa fa-home fa-lg'></i></td>
                                <td>&nbsp;<strong>$CustAddress </strong></td>
                            </tr>
                            <tr>
                                <td>&nbsp;<strong>$CustCity, $CustProv, $CustCountry</strong></td>
                            </tr>
                            <tr>
                                <td>&nbsp;<strong>$CustPostal </strong><br><br></td>
                            </tr>
                            </table>
                            <table class='book_prof_num'>
                            <tr>
                                <td style='width: 130px;'><strong>Home Phone:</strong></td>
                                <td>(".substr($CustHomePhone, 0, 3).") ".substr($CustHomePhone, 3, 3)."-".substr($CustHomePhone,6)."</td>
                            </tr><tr>
                                <td><strong>Business Phone:</strong></td>
                                <td>(".substr($CustBusPhone, 0, 3).") ".substr($CustBusPhone, 3, 3)."-".substr($CustBusPhone,6)."</td>
                            </tr><tr>
                                <td><strong>Customer ID:</strong></td>
                                <td>$CustomerId</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-xs-12 col-sm-7 payment style'>
                        <h3><i class='fa fa-credit-card'></i> &nbsp;<strong>Billing Information</strong></h3> 
                        <hr class='style-one'>
                        <p>Please enter your payment details below.</p><br>
                        <form class='form-horizontal' role='form' method='post' action='customer.php?PackageId=$pkg'>
                          <div class='form-group'>"; ?>
                            <label class='col-sm-4 control-label'>Credit Card Type</label>
                            <div class='col-sm-8'>
                              <div class='col-sm-12'>
                                  <label class='radio-inline'>
                                    <input type='radio' name='paymentmethod' id='visa' value='Visa' checked> <i class='fa fa-cc-visa fa-2x'></i>
                                  </label>
                                  <label class='radio-inline'>
                                    <input type='radio' name='paymentmethod' id='mastercard' value='Mastercard'> <i class='fa fa-cc-mastercard fa-2x'></i>
                                  </label>
                                  <label class='radio-inline'>
                                    <input type='radio' name='paymentmethod' id='amex' value='American Express'> <i class='fa fa-cc-amex fa-2x'></i></i>
                                  </label>
                                  <label class='radio-inline'>
                                    <input type='radio' name='paymentmethod' id='discover' value='Discover'> <i class='fa fa-cc-discover fa-2x'></i></i></i>
                                  </label>
                                </div>
                            </div>
                          </div>
                          <div class='form-group'>
                            <label class='col-sm-4 control-label'>Credit Card Number</label>
                            <div class='col-xs-8 col-sm-6'>
                              <input type='text' class='form-control' id='cardnumber' placeholder='Enter your credit card' size='16' maxlength="16">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label">Expiration Date</label>
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
                            <label class="col-xs-12 col-sm-4 control-label">Name on Card</label>
                            <div class="col-xs-6 col-sm-4" style="margin-right: -14px;">
                              <input type="text" class="form-control" id="firstname" placeholder="First Name">
                            </div>
                              <div class="col-xs-6 col-sm-4" >
                                  <input type="text" class="form-control" id="lastname" placeholder="Last Name">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-offset-4  col-sm-8 checkbox-inline">
                                &nbsp; &nbsp; <input type="checkbox" id="billing" value="billing" checked> Use personal information as Billing Address? 
                            </label>
                          </div>
                <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label">Reward Miles</em></label>
                            <div class="col-xs-5 col-sm-4" style="margin-right: -14px;">
                              <select name="rewardcard" class="form-control">
                                  <option value="">None</option>
                                  <option value="Air Miles">Air Miles</option>
                                  <option value="AeroPlan">AeroPlan</option>
                                  <option value="AeroPlan Gold">AeroPlan Gold</option>
                                  <option value="Coast Rewards">Coast Rewards</option>
                                  <option value="Mariott Rewards">Mariott Rewards</option>
                              </select>
                            </div>
                              <div class="col-xs-7 col-sm-4" >
                                  <input type="text" class="form-control" id="rewardnumber" placeholder="Card Number" maxlength="14">
                              </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-12">
                              <p><em>Please confirm your information before submitting. Your credit card will be charged.</em></p>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-10">
                              <button type="submit" class="btn btn-primary">SUBMIT</button>
                            </div>
                          </div>
                        </form>

                    </div>
                    <div class="col-xs-6 col-sm-5 paymentseal">
                        <img src="img/nortonseal.png" style="height: 90px;"><img src="img/verisignseal.jpg" style="height: 80px;"><img src="img/securityseal01.jpg" style="height: 80px;">
                    </div>
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        </div>
<?php
    include("footer.php");
?>