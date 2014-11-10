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

$sql = "SELECT PackageId, PkgName, PkgStartDate, PkgEndDate, PkgBasePrice, PkgDesc FROM packages";
$result = $conn->query($sql);
		
echo "<div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
             <div id='body'>
                 <div class='packages'>";
if ($result->num_rows > 0) {
	// output data of each row
    while($row = $result->fetch_assoc()) {
echo "           <div class='row style pkg'>
                    <div class='pkg_title'><h2> ".$row["PkgName"]." </h2></div>
                    <div class='pkg_book'><a href='bookings.php?PackageId=".$row["PackageId"]."'>BOOK NOW</a> &nbsp;<span class='book_arrow'><i class='fa fa-arrow-right'></i></span></div>
                    <div class='pkg_price'><span><i class='fa fa-usd'></i>".$row["PkgBasePrice"]."</span><br>per person, plus GST</div>
                    <div class='pkg_image'> <img src = 'img/carribean.jpg'></div>
                    <div class='pkg_desc'>
                        <p>".$row["PkgDesc"]."</p>
                        <div class='pkg_start_date'><p>Start date: ".$row["PkgStartDate"]." </p></div>
                        <div class='pkg_End_date'><p>End Date: ".$row["PkgEndDate"]." </p></div>
                    </div>
                </div>
            <hr>";	
    } 
} else {
    echo "0 results";
}
$conn->close();


?>	         </div>
            </div> <!--- End of body --->
        </div> <!-- End of Container -->
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>