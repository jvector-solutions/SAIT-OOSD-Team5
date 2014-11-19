<?php
    session_start();
    $link = mysqli_connect("localhost","root","","travelexperts") or die("Connection Error: " . mysqli_error());
	$cust_email = $_SESSION['cust_email'];
	$sql = "select * from customers where CustEmail = '$cust_email'";
	$result = mysqli_query($link,$sql);
	while ($row1 = mysqli_fetch_array($result)) {
        extract($row1);          // extract() will assign each row as a variable
    }
    $sql2 ="select * from bookings where CustomerId='$CustomerId'";
    $result2 = mysqli_query($link,$sql2);
	while ($row2 = mysqli_fetch_array($result2)) {
        extract($row2); 
    }
    if (!isset($BookingId) ? $BookingId : null) {
        $BookingId='';
        $Description='';
        $Destination='';
        $BasePrice='';
    } else {
        $sql3 ="select * from bookingdetails where BookingId='$BookingId'";
        $result3 = mysqli_query($link,$sql3);
        while ($row3 = mysqli_fetch_array($result3)) {
            extract($row3); 
        }
    }

	$title = "Customer";
    $display = "Welcome, $CustFirstName!";
	$slider = "05";
    include('header.php');
    echo "
<div class='container-fluid'> <!-- Start of Container -->
            <!-- Main body begins here -->
            <div id='body'>
                    <div class='col-xs-12 col-sm-7 bookings style' style='margin-right: 20px;'>
                        <div class='current_bookings'>
                            <h3><i class='fa fa-suitcase'></i> &nbsp;<strong>Current Bookings</strong></h3>
                            <hr class='style-one'>
                            lkjalkja;sldkfjasdf
                        </div>    
                        <div class='previous_bookings'>
                            <h3><i class='fa fa-suitcase'></i> &nbsp;<strong>Previous Bookings</strong></h3>
                            <hr class='style-one'>
                            <table>
                                <tr>
                                    <th><strong>Booking No.</strong></th>
                                    <th><strong>Booking Date</strong></th>
                                    <th><strong>Return Date</strong></th>
                                    <th><strong>Destination</strong></th>
                                    <th><strong>Price</strong></th>
                                </tr>
                                <tr>
                                    <td>$BookingNo</td>
                                    <td>".date('M d, Y',strtotime($BookingDate))."</td>
                                    <td>".date('M d, Y',strtotime($TripEnd))."</td>
                                    <td>$Destination</td>
                                    <td>$".sprintf("%.2f",$BasePrice)."</td>
                                </tr>
                            </table>        
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
                </div>
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        </div>";
    mysqli_close($link);
    include("footer.php");
?>