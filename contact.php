<!-- contacts.php page 
Author Name: Brian Peng
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic information for contact page
//-->

<?php
    session_start();//start a session
    $title = "Contact";
    $display = "About the Travel Experts";
    $slider = "04";
    include('header.php');
?>
        <div class="container-fluid"> <!-- Start of Container -->
            
            <!-- Main body begins here -->
            <div id="body">
                <h1>About Us</h1>
                <div class="row style about">
                    <div class="col-xs-12 col-sm-10 col-md-10">
                        <img src="img/logo2.png"><br>
                        <p>The <strong>Travel Experts</strong> aim to provide you and your family with the best packaged deals and prices from our exceptional customer service team who are here to help you plan the perfect vacation, satisfaction guaranteed!<br><br>To inquire about our packages, make a booking, or to speak with one of our agents please contact us toll-free at: <h2><i class="fa fa-phone-square"></i> &nbsp;1-800-222-3456</h2></p>
                    </div>
                </div>
                <!-- BEGIN Agency Information Row //-->
                <h1>Office Locations &amp; Contact</h1>
				<?php
				   $link=mysqli_connect("localhost","root","","travelexperts") or 
	                         die("Connect error:". mysqli_connect_error());  //link to the database
				   $html = "";  //use to construct html sentences
				   $sql = "select * from agencies";
				   $result = mysqli_query($link,$sql); //get the result of agencies from the database
				   $agencyN = 1;          
				   if(mysqli_num_rows($result)>0)
				   {
				     while($row = mysqli_fetch_assoc($result))  //get the rows from the result
                     { 
					   //construct the html sentence to show the agencies information from the database
					   $html .= "<div class='row style agency'>";
					   //use Google map to show the locations of the agencies according to their longitudes and latitudes
					   $html .= "<div class='agency_map'><img src='https://maps.googleapis.com/maps/api/staticmap?center=" . $row["Longitude"] . "," .$row["Latitude"] . "&zoom=14&size=500x800&maptype=roadmap
                                 &markers=color:red%7Clabel:A%7C" . $row["Longitude"] . "," .$row["Latitude"] . "' style='max-width: 100%;'></div>";
					   $html .= "<div class='agency_address'><h3><i class='fa fa-building-o'></i> &nbsp;AGENCY " . $agencyN . "</h3><hr class='style-two'>";
					   $agencyN = $agencyN + 1;
					   $sql1 = "select * from agents where AgencyId=" . $row["AgencyId"];
					   $result1  = mysqli_query($link,$sql1);//get result of agents information from the database 
					   $html .= "<table><tr><td rowspan='5' style='vertical-align: top;'><i class='fa fa-map-marker fa-2x'></i></td>";
					   $html .= "<td><strong>Address</strong></td></tr>";
					   $html .= "<tr><td>" . $row["AgncyAddress"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyCity"] . ", " . $row["AgncyProv"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyPostal"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyCountry"] . "</td></tr>";
					   $html .= "<tr><td>&nbsp;</td></tr>";
					   $html .= "<tr><td rowspan='2' style='vertical-align: top;'><i class='fa fa-phone fa-2x'></i></td>
					             <td><strong>Telephone</strong></td></tr>";
					   $html .= "<tr><td>&nbsp;(".substr($row["AgncyPhone"], 0, 3).") ".substr($row["AgncyPhone"], 3, 3)."-".substr($row["AgncyPhone"],6)."</td></tr>";
					   $html .= "<tr><td rowspan='2' style='vertical-align: top;'><i class='fa fa-fax fa-lg'></td>
					             <td><strong>Fax</strong></td></tr>";
					   $html .= "<tr><td>&nbsp;(".substr($row["AgncyFax"], 0, 3).") ".substr($row["AgncyFax"], 3, 3)."-".substr($row["AgncyFax"],6)."</td></tr></table></div>";
					   $html .= "<div class='agents_list'><h3><i class='fa fa-users'></i> &nbsp;AGENTS</h3><hr class='style-two'>";
					   
					   
					   
					   while($row1 = mysqli_fetch_assoc($result1))//get the rows from the result
					   {
					      //construct the html sentence to show the agents information from the database
					      $html .= "<div class='agent'>";
                          $html .= "<h3>". $row1["AgtFirstName"] . " " . $row1["AgtMiddleInitial"] . " " . $row1["AgtLastName"] . "</h3>, <em>" . $row1["AgtPosition"] . " Agent</em><br>";
						  $html .= "<table><tr><td>&nbsp;</td><td><i class='fa fa-phone'></td><td>" . $row1["AgtBusPhone"] . "</td></tr>";
						  $html .= "<tr><td>&nbsp;</td><td><i class='fa fa-envelope-o'></i></td><td><a href='mailto:" . $row1["AgtEmail"] . "'>" . $row1["AgtEmail"] . "</a></td></tr></table>
                                  </div>";
					   }
					   $html .= "</div>";
					   $html .= "</div>";
					 } 
				   }
				   
				   print($html);//show the html page
				   mysqli_close($link);//close the database
				 ?>
				   
         </div> <!-- End of body -->
        </div> <!-- End of Container -->
<?php
    include("footer.php");
?>