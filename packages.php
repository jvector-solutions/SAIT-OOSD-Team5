<!-- 
Packages.php page 
Author Name: Mahmood Qureshi
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying packages information from database
-->


<?php
    //declaring variables
	$title = "Packages";
    $display = "Vacation Packages";
    $slider = "03";
    include('header.php'); // calling external header file
		
    $servername = "localhost"; //Declaring variables containing servername, username, PW and DB name.
    $username = "root";
    $password = "";
    $dbname = "travelexperts";

    // Create connection with database
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection with database
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
            echo "      <div class='row style pkg'>
                        <div class='pkg_title'><h2>".$row["PkgName"]." </h2></div>
                        <div class='pkg_book'><a href='bookings.php?PackageId=".$row["PackageId"]."'>BOOK NOW</a> &nbsp;<span class='book_arrow'><i class='fa fa-arrow-right'></i></span></div>
                        <div class='pkg_price'><span><i class='fa fa-usd'></i>".sprintf("%d",$row["PkgBasePrice"])."</span><strong>CAD</strong><br>per person, plus GST</div>
                        <div class='pkg_image'> <img src = 'img/package0".$row["PackageId"].".jpg'></div> 
                        <div class='pkg_desc'>
                            <div class='pkg_desc_box'><h4><strong>".$row["PkgDesc"]."</strong></h4></div>
                            <div class='pkg_table'>
                            <table><tr>
                                <th><strong>START DATE</strong></th>
                                <th><strong>END DATE</strong></th>
                                <th><strong>DURATION</strong></th>
                             </tr>
                             <tr>
                                <td><strong>".strtoupper(date('M',strtotime($row['PkgStartDate'])))."</strong><br><span class='pkg_day'>".date('d',strtotime($row['PkgStartDate']))."</span><br><strong>".date('Y',strtotime($row['PkgStartDate']))."</strong></td>
                                <td><strong>".strtoupper(date('M',strtotime($row['PkgEndDate'])))."</strong><br><span class='pkg_day'>".date('d',strtotime($row['PkgEndDate']))."</span><br><strong>".date('Y',strtotime($row['PkgEndDate']))."</strong></td>
                                <td>for<br><span class='pkg_day'>".floor((strtotime($row['PkgEndDate'])-strtotime($row['PkgStartDate']))/(60*60*24))."</span><br>DAYS</td>
                             </tr>
                             </table>
                             </div>
                        </div>
                    </div>
                <hr>";	
        } 
    } else {
        echo "0 results";
    }
    $conn->close(); //closing connection with database
?>	         
                </div>
            </div> <!--- End of body --->
        </div> <!-- End of Container -->
<?php
    include("footer.php");
?>