<?php
    $title = "Packages";
    $display = "Vacation Packages";
    $slider = "03";
    include('header.php');
	
	
		
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "travelexperts";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT PkgName, PkgStartDate, PkgEndDate, PkgBasePrice, PkgDesc FROM packages";
$result = $conn->query($sql);


		

if ($result->num_rows > 0) {
    echo "<table>";
	// output data of each row
    while($row = $result->fetch_assoc()) {
        "<tr><td><h2> ".$row["PkgName"]." </h2></td></tr>
			
			<tr><td>Start Date: ".$row["PkgStartDate"]." </td></tr>
			<tr><td>End Date: ".$row["PkgEndDate"]." </td></tr>
			<tr><td>Package Base Price: ".$row["PkgBasePrice"]." </td></tr>
			<tr><td> ".$row["PkgDesc"]."</td></tr>";
			
	
			echo "<div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
<<<<<<< HEAD
             <div id='body'>
                 <div class='packages'>
                    <div class='row style pkg'>
                        <div class='pkg_title'><h2> ".$row["PkgName"]." </h2></div>
                        <div class='pkg_book'>BOOK NOW &nbsp;<span class='book_arrow'><i class='fa fa-arrow-right'></i></span></div>
                        <div class='pkg_price'><span><i class='fa fa-us'></i>".$row["PkgBasePrice"]."</span><br>per person, plus GST</div>
                        <div class='pkg_image'> <img src = 'img/carribean.jpg'>
						
						
												
												
						
						</div>
						
                        <div class='pkg_desc'>
                            <p>".$row["PkgDesc"]."</p>
							<div class='pkg_start_date'><p>Start date: ".$row["PkgStartDate"]." </p></div>
							<div class='pkg_End_date'><p>End Date: ".$row["PkgEndDate"]." </p></div>
							
						</div>
                    </div>";
					
}
    echo "</table>";
} else {
    echo "0 results";
}
$conn->close();
	?>	
                    
=======
            <div id="body">
                <div class="packages">
                    <div class="row style pkg">
                        <div class="pkg_title"><h2>CARIBBEAN NEW YEAR</h2></div>
                        <div class="pkg_book"><a href="bookings.php?PackageId=1">BOOK NOW</a> &nbsp;<span class="book_arrow"><i class="fa fa-arrow-right "></i></span></div>
                        <div class="pkg_price"><span><i class="fa fa-usd"></i>4800</span><br>per person, plus GST</div>
                        <div class="pkg_image"><img src="img/carribean.jpg"></div>
                        <div class="pkg_desc">
                            <p>Cruise the Caribbean and Celebrate the New Year</p>
                            <p>Packages available form January 2015</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row style pkg">
                        <div class="pkg_title"><h2>POLYNESIAN PARADISE</h2></div>
                        <div class="pkg_book"><a href="bookings.php?PackageId=2">BOOK NOW</a> &nbsp;<span class="book_arrow"><i class="fa fa-arrow-right "></i></span></div>
                        <div class="pkg_price"><span><i class="fa fa-usd"></i>3000</span><br>per person, plus GST</div>
                        <div class="pkg_image"><img src="img/hawaii.jpg"></div>
                        <div class="pkg_desc">
                            <p>8 days all inclusive Hawaiian vacation</p>
                            <p>Packages available form December 2014 to January 2015</p>
                        </div>
                    </div>
                    <hr>
                    <div class="row style pkg">
                        <div class="pkg_title"><h2>ASIAN EXPEDITION</h2></div>
                        <div class="pkg_book"><a href="bookings.php?PackageId=3">BOOK NOW</a> &nbsp;<span class="book_arrow"><i class="fa fa-arrow-right "></i></span></div>
                        <div class="pkg_price"><span><i class="fa fa-usd"></i>2800</span><br>per person, plus GST</div>
                        <div class="pkg_image"><img src="img/asian.jpg"></div>
                        <div class="pkg_desc">
                            <p>Airfare, Hotel and economy tour</p>
                            <p>Packages available from January 2015</p>
                        </div>
                    </div>
<!-- Imagine this inside php
                    
                 print("<div class='row style pkg'>);
                 print("<div class='pkg_title'><h2>'+.upperCase($pkgTitle="ASIAN EXPEDITION".+')</h2></div>")
                 print("<div class='pkg_book'>BOOK NOW &nbsp;<span class="book_arrow"><i class='fa fa-arrow-right'></i></span></div>");
                 print("<div class='pkg_price'><span><i class='fa fa-usd'></i> $pkgPrice='2800' </span><br>per person, plus GST</div>);
                 print("<div class='pkg_image'><img src='img/asian.jpg'></div>");
                 print("<div class='pkg_desc'>")
                 print("<p> $pkgDescription='Airfare, Hotel and economy tour'</p>");
                 print("<p> $pkgDates='Packages available from January 2015'</p>");
                 print("</div>");
                 print("</div>");   
                    
                    
                    
                    
                    
                    //-->
                    
                    
                    <hr>
                    <div class="row style pkg">
                        <div class="pkg_title"><h2>EUROPEAN VACATION</h2></div>
                        <div class="pkg_book"><a href="bookings.php?PackageId=4">BOOK NOW</a> &nbsp;<span class="book_arrow"><i class="fa fa-arrow-right "></i></span></div>
                        <div class="pkg_price"><span><i class="fa fa-usd"></i>3000</span><br>per person, plus GST</div>
                        <div class="pkg_image"><img src="img/europe.jpg"></div>
                        <div class="pkg_desc">
                            <p>European tour with Rail pass &amp; Travel Insurance</p>
                            <p>Packages available from 1st quarter 2015</p>
                        </div>
                    </div>
>>>>>>> origin/master
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->


		
		
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>
