<!-- index.php page 
Author Name: John Nguyen
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying static information and features for the index page.
//-->

<?php
    session_start();
    $title = "Home";
    $display = "";
    $slider = "01";
    include('header.php');
?>
        <div class="container-fluid"> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id="body">
                <div class="row">
                    <div class="col-md-12 main_booking">
                        <div class="row main_welcome">
                            <h1>Welcome to the Travel Experts &nbsp;<i class="fa fa-globe"></i> <i class="fa fa-plane"></i> <i class="fa fa-suitcase"></i></h1> 
                        </div>
                        <div class="row main_left">
                            <div class="col-xs-12 col-md-7 search_box">
                                <h2><i class="fa fa-search"></i> &nbsp;<strong>Search Vacation Packages</strong></h2>
                                <hr class="style-three">
                                <form role="form">
                                <table style="width: 100%;">
                                    <tr>
                                        <td colspan="2" class="search_title">&nbsp;<i class="fa fa-map-marker fa-lg"></i> &nbsp;Leaving from</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="text" class="form-control" id="destination" placeholder="Enter address, city, or airport">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="search_title">&nbsp;<i class="fa fa-map-marker fa-lg"></i> &nbsp;Destination</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="text" class="form-control" id="destination" placeholder="Enter address, city, or airport">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="search_title">&nbsp;<i class="fa fa-calendar"></i> &nbsp;Departure Date</td> 
                                        <td class="search_title">&nbsp;<i class="fa fa-clock-o"></i> &nbsp;Duration</td> 
                                    </tr>
                                    <tr>
                                        <td><input type="date" class="form-control"></td>
                                        <td><select id="duration" class="form-control">
                                                <option value="under3">Less than 3 nights</option>
                                                <option value="4to5">4 to 5 nights</option>
                                                <option value="6to7">6 to 7 nights</option>
                                                <option value="8to9">8 to 9 nights</option>
                                                <option value="10to11">10 to 11 nights</option>
                                                <option value="12to13">12 to 13 nights</option>
                                                <option value="over14">Over 14 nights</option>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="search_title" colspan="2">&nbsp;<i class="fa fa-users"></i> &nbsp;Number of Guests</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <div class="col-sm-6">
                                                <p>Adults (18+)</p>
                                                <select id="num_adults" class="form-control">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-6">
                                                <p>Children (0-7)</p>
                                                <select id="num_children" class="form-control">
                                                    <option value="0">0</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-12">
                                                <a href="#" class="group">Click here for bookings of 10 or more</a>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="search_title">&nbsp;<i class="fa fa-usd"></i> &nbsp;Price Range (per Package)</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select id="pricerange" class="form-control">
                                                <option value="under1500">Under $1500</option>
                                                <option value="1501-3000">$1501 to $3000</option>
                                                <option value="3001-5000">$3001 to $5000</option>
                                                <option value="5001-7500">$5001 to $7500</option>
                                                <option value="over7500">Over $7500</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <button type="submit" class="btn btn-primary btn-lg" style="margin-top: 10px;">Search</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            </div>
                            <div class="col-xs-12 col-md-5">
                                <div class="main_right">
                                    <div class="col-xs-12 col-sm-12 sidebar">
                                        <img src="img/sidebar.png" class="img-responsive">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row col-xs-12 col-md-12" >
                    <div class="advertisement">
                        <a href="#"><img src="img/banner_ad.png" class="img-responsive"></a>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-xs-12 col-md-4">
                        <div style="text-align: center;"><i class="fa fa-star-o fa-3x" style="color: #edc800;"></i> <i class="fa fa-star-o fa-3x" style="color: #edc800;"></i> <i class="fa fa-star-o fa-3x" style="color: #edc800;"></i> <i class="fa fa-star-o fa-3x" style="color: #edc800;"></i> <i class="fa fa-star-o fa-3x" style="color: #edc800;"></i><br>
                        <h2 style="font-weight: 600; font-family: 'Sintony', sans-serif;"><strong>Five-Star Service</strong></h2></div><br>
                        <strong><i class="fa fa-star"></i> TRIP PLANNING</strong><br>
                        <p>Our experienced agents will provide you with all the trip planning services you require.</p>
                        <strong><i class="fa fa-star"></i> PACKAGE BOOKING</strong><br>
                        <p>Package booking is simple and intuitive with our booking and payment system.</p>
                        <strong><i class="fa fa-star"></i> CHEAP FLIGHTS</strong><br>
                        <p>Prices you won't find anywhere else. If you find a competitor with the same price, we'll price match!</p>
                        <strong><i class="fa fa-star"></i> CARS &amp; HOTELS</strong><br>
                        <p>Car and hotel bookings are included on some packages to give you ease and peace of mind.</p>
                        <strong><i class="fa fa-star"></i> POPULAR DESTINATIONS</strong><br>
                        <p>Popular destinations are added daily so be sure to check back often.</p><br>
                        <p>The Travel Experts aims to be your discount travel package and booking company. Email us at <a href="#"><u>info@travelexperts.com</u></a> for more information.</p>
                    </div>
                    <div class="col-xs-12 col-md-8 main_img">
                        <h3><strong>FEATURED PACKAGES</strong></h3>
                        <div class="row">
                            <?php 
                            $link = mysqli_connect("localhost","root","","travelexperts") or die("Connection Error: " . mysqli_error());
                            $cust_email = $_SESSION['cust_email'];
                            $sql = "select * from customers where CustEmail = '$cust_email'";
                            $result = mysqli_query($link,$sql);
                            while ($row1 = mysqli_fetch_array($result)) {
                                extract($row1);          // extract() will assign each row as a variable
                            }


                            ?>
                            <div class="col-xs-6 col-md-6 main_img_div">
                                <img src="img/package5.jpg" class="img-responsive">
                                <span class="main_img_name">Temples of Myanmar</span><span class="main_img_price"><strong>$3400</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <img src="img/package6.jpg" class="img-responsive">
                                <span class="main_img_name">Japanese Culture Tour</span><span class="main_img_price"><strong>$5600</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <img src="img/package7.jpg" class="img-responsive">
                                <span class="main_img_name">New York Broadway</span><span class="main_img_price"><strong>$550</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <img src="img/package10.jpg" class="img-responsive">
                                <span class="main_img_name">Castles of Scotland</span><span class="main_img_price"><strong>$3750</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        <div class="email">
            <div class="col-xs-6 col-md-6 text-right" style="display: block;">
            <h2 style="color: #fff;">Sign up for Exclusive Package Deals</h2><h5 style="color: #fff;">Exclusive access to coupons, special offers and promotions.</h5>
            </div>
            <div class="col-xs-6 col-md-6">
                <form class="form-inline" role="form">
                    <input type="text" size="39" name="subscribe" class="form-control" style="margin-top: 10px;">
                    <input type="button" value="Sign Up" class="form-control" style="width: 86px; margin-top: 10px;">
                </form>
            </div>
        </div>
<?php
    include("footer.php");
?>





