<!-- packages.php page 
Author Name: Mahmood Qureshi
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic information for the packages page
//-->

<?php
    session_start();

    $title = "Packages";
	$title = "Packages";
    $display = "Vacation Packages";
    $slider = "03";
    include('header.php'); // calling external header file

    $servername = "localhost"; //Declaring variables containing servername, username, PW and DB name.
    $username = "root";
    $password = "";
    $dbname = "travelexperts";
    $date = date("Y-m-d");

    // Create connection with database
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection with database
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

    $sql = "SELECT PackageId, PkgName, PkgStartDate, PkgEndDate, PkgBasePrice, PkgDesc FROM packages ORDER BY PkgStartDate";
    $result = $conn->query($sql);
    echo "<div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
             <div id='body'>
                 <div class='packages'>";
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            // The following loop checks if the Package End Date is greater than the current date, and if so prints out the HTML to list it on the page.
            if ($row["PkgEndDate"] > $date) {
            echo "      <div class='row style pkg'>
                        <div class='pkg_title'><h2>".$row["PkgName"]." </h2></div>
                        <div class='pkg_book'><a href='bookings.php?PackageId=".$row["PackageId"]."'>BOOK NOW</a> &nbsp;<span class='book_arrow'><i class='fa fa-arrow-right'></i></span></div>
                        <div class='pkg_price'><span><i class='fa fa-usd'></i>".sprintf("%d",$row["PkgBasePrice"])."</span><strong>CAD</strong><br>per person, plus GST</div>
                        <div class='pkg_image'> <img src = 'img/package".$row["PackageId"].".jpg'></div> 
                        <div class='pkg_desc'>";
                // The following loop checks if the Start Date is less than the current date and highlights it in red
                if ($row["PkgStartDate"] < $date) {
                    echo "  <div class='pkg_desc_box'>".$row["PkgDesc"]." <span style='color: rgb(222, 55, 55);'> &nbsp;<i class='fa fa-exclamation-triangle'></i> <strong>IN PROGRESS</strong></span></div>
                            <div class='pkg_table'>
                            <table>
                            <tr>
                                <th style='background-color: rgb(222, 55, 55);'><strong>START DATE</strong></th>
                                <th><strong>END DATE</strong></th>
                                <th><strong>DURATION</strong></th>
                             </tr>
                             <tr><td style='background-color: rgb(222, 55, 55);'>
                                  <strong style='color: #fff;'>".strtoupper(date('M',strtotime($row['PkgStartDate'])))."</strong>
                                  <br><span class='pkg_day' style='color: #fff;'>".date('d',strtotime($row['PkgStartDate']))."</span><br><strong style='color: #fff;'>".date('Y',strtotime($row['PkgStartDate']))."</strong>
                                </td>";
                        $msg = "*In Progress";
                } else {
                    echo "  <div class='pkg_desc_box'>".$row["PkgDesc"]."</div>
                            <div class='pkg_table'>
                            <table>
                            <tr>
                                <th><strong>START DATE</strong></th>
                                <th><strong>END DATE</strong></th>
                                <th><strong>DURATION</strong></th>
                             </tr>
                             <tr><td>
                                    <strong>".strtoupper(date('M',strtotime($row['PkgStartDate'])))."</strong>
                                    <br><span class='pkg_day'>".date('d',strtotime($row['PkgStartDate']))."</span><br><strong>".date('Y',strtotime($row['PkgStartDate']))."</strong>
                                </td>";
                    }
            echo "              <td><strong>".strtoupper(date('M',strtotime($row['PkgEndDate'])))."</strong><br><span class='pkg_day'>".date('d',strtotime($row['PkgEndDate']))."</span><br><strong>".date('Y',strtotime($row['PkgEndDate']))."</strong></td>
                                <td><span class='pkg_day'>".floor((strtotime($row['PkgEndDate'])-strtotime($row['PkgStartDate']))/(60*60*24))."</span><br>Nights</td>
                             </tr>
                             </table>
                             </div>
                        </div>
                    </div>
                <hr>";	
        }
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