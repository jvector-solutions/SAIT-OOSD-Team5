<?php
    $title = "Home";
    $display = "Package Booking";
    $slider = "03";
    $link = mysqli_connect("localhost","root","","travelexperts") or die("Connection Error: " . mysqli_error());
    $pkg = $_GET['PackageId'];
    // This $sql will select the package information based on the GET variable passed from the Packages page.
    $sql = "select PkgName,PkgStartDate,PkgEndDate,PkgDesc,PkgBasePrice from Packages where PackageId='$pkg'"; 
    $result = mysqli_query($link,$sql);
    while ($row = mysqli_fetch_array($result)) {
        extract($row);          // extract() will assign each row as a variable, ie. $PkgName
    }
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
                            <h3><strong>$PkgName</strong></h3>
                            
                        </div>
                        <div class="col-xs-4 col-sm-5 style">
                            <h2>Customer Information</h2><hr class="style-two">
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
