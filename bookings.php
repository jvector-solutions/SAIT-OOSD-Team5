<?php
    session_start();
    if (!isset($_SESSION['loggedin']))
	{
	   $_SESSION['pagename']="bookings.php";
	   header("Location: registration.php");
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
    
    $pkg = $_GET['PackageId'];
    // This $sql will select the package information based on the GET variable passed from the Packages page.
    $sql = "select PkgName,PkgStartDate,PkgEndDate,PkgDesc,PkgBasePrice from Packages where PackageId='$pkg'"; 
    $result = mysqli_query($link,$sql);
    while ($row = mysqli_fetch_array($result)) {
        extract($row);          // extract() will assign each row as a variable, ie. $PkgName
    }
    

    mysqli_close($link);


    include("functions.php");
    include('header.php');
?>
<div class="container-fluid"> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id="body">
                <div class="row">
                    <div class="col-sm-12 bookings" style="margin: 10px 20px;">
                        <div class="col-xs-7 col-sm-6 style" >
                            <h2>Package Information</h2>
                            <hr class="style-two">
							<?php
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
							?>
                           
                            
                        </div>
                        <div class="col-xs-4 col-sm-5 style">
                            <h2>Customer Information</h2><hr class="style-two">
							<?php 
							   $html = "<table border='1'><tr><td><h3><strong> $CustFirstName, $CustLastName </strong></h3></td></tr>";
							  
							   $html .= "<tr><td><h3><strong> $CustAddress </strong></h3></td></tr>";
							   
							   $html .= "<tr><td><h3><strong> $CustCity, $CustProv  $CustCountry </strong></h3></td></tr>";
							   
							   $html .= "<tr><td><h3><strong> $CustPostal </strong></h3></td></tr>";
							   
							   $html .= "<tr><td><h3><strong> $CustHomePhone</strong></h3></td></tr>";
							   $html .= "<tr><td><h3><strong> $CustBusPhone</strong></h3></td></tr></table>";
							   print($html);
							?>
                        </div>
                    </div>
                </div>
                <div class="row payment style" style="margin: 10px 35px;">
                    <h2>Payment</h2>


                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        </div>
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>
