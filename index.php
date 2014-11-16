<?php
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
                                    <div class="col-xs-12 col-sm-12">
                                        <h3><strong>Save up to 50% on your next vacation!</strong></h3><br>
                                    </div>
                                    <div class="col-xs-12 col-sm-12">
                                        <h4>Call us at 1-800-222-3456</h4>
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
                        <p>We blah blah blah..</p>
                        <strong><i class="fa fa-star"></i> PACKAGE BOOKING</strong><br>
                        <p>Package booking blah blah blah..</p>
                        <strong><i class="fa fa-star"></i> CHEAP FLIGHTS</strong><br>
                        <p>Cheap flights blah blah blah..</p>
                        <strong><i class="fa fa-star"></i> CARS &amp; HOTELS</strong><br>
                        <p>Car and hotel booking blah blah blah..</p>
                        <strong><i class="fa fa-star"></i> POPULAR DESTINATIONS</strong><br>
                        <p>Popular destinations blah blah blah..</p><br>
                        <p>The Travel Experts aims to be your discount travel package and booking company. Email us at <a href="#"><u>info@travelexperts.com</u></a> for more information.</p>
                    </div>
                    <div class="col-xs-12 col-md-8 main_img">
                        <h3><strong>FEATURED PACKAGES</strong></h3>
                        <div class="row">
                            <div class="col-xs-6 col-md-6 main_img_div">
                                <img src="img/package01.jpg" class="img-responsive">
                                <span class="main_img_name">Carribean New Year</span><span class="main_img_price"><strong>$4800</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <a href="packages.php"><img src="img/package02.jpg" class="img-responsive"></a>
                                <span class="main_img_name">Polynesian Paradise</span><span class="main_img_price"><strong>$3000</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <a href="packages.php"><img src="img/package03.jpg" class="img-responsive"></a>
                                <span class="main_img_name">Asian Expedition</span><span class="main_img_price"><strong>$2800</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
                            </div>
                            <div class="col-xs-6 col-md-6  main_img_div">
                                <a href="packages.php"><img src="img/package04.jpg" class="img-responsive"></a>
                                <span class="main_img_name">European Vacation</span><span class="main_img_price"><strong>$3000</strong></span><br><a href="packages.php"><span class="main_img_click">Click for more details &nbsp;<i class="fa fa-arrow-circle-right"></i></span></a>
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
