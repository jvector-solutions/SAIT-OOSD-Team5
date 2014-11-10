<!-- contacts.php page 
Author Name: Brian Peng
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic information for contact page
//-->

<?php
    $title = "Contact";
    $display = "Contact Information";
    $slider = "04";
    include('header.php');
?>
        <div class="container-fluid"> <!-- Start of Container -->
            
            <!-- Main body begins here -->
            <div id="body">
                
                <!-- BEGIN Agency Information Row //-->
				<?php
				   $link=mysqli_connect("localhost","root","","travelexperts") or 
	                         die("Connect error:". mysqli_connect_error());
				   $html = "";
				   $sql = "select * from agencies";
				   $result = mysqli_query($link,$sql);
				   $agencyN = 1;
				   if(mysqli_num_rows($result)>0)
				   {
				     while($row = mysqli_fetch_assoc($result))
                     { 
					   $html .= "<div class='row style agency'>";
					   $html .= "<div class='agency_map'><img src='https://maps.googleapis.com/maps/api/staticmap?center=" . $row["Longitude"] . "," .$row["Latitude"] . "&zoom=17&size=250x300&maptype=roadmap
                                 &markers=color:red%7Clabel:A%7C" . $row["Longitude"] . "," .$row["Latitude"] . "' style='max-width: 100%;'></div>";
					   $html .= "<div class='agency_address'><h3>AGENCY" . $agencyN . "</h3><hr class='style-two'>";
					   $agencyN = $agencyN + 1;
					   $sql1 = "select * from agents where AgencyId=" . $row["AgencyId"];
					   $result1  = mysqli_query($link,$sql1);
					   $html .= "<table><tr><td rowspan='5' style='vertical-align: top;'><i class='fa fa-map-marker fa-2x'></i></td>";
					   $html .= "<td><strong>Address</strong></td></tr>";
					   $html .= "<tr><td>" . $row["AgncyAddress"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyCity"] . ", " . $row["AgncyProv"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyPostal"] . "</td></tr>";
					   $html .= "<tr><td>" . $row["AgncyCountry"] . "</td></tr>";
					   $html .= "<tr><td>&nbsp;</td></tr>";
					   $html .= "<tr><td rowspan='2' style='vertical-align: top;'><i class='fa fa-phone fa-2x'></i></td>
					             <td><strong>Telephone</strong></td></tr>";
					   $html .= "<tr><td>&nbsp;" . $row["AgncyPhone"] . "</td></tr>";
					   $html .= "<tr><td rowspan='2' style='vertical-align: top;'><i class='fa fa-fax fa-lg'></td>
					             <td><strong>Fax</strong></td></tr>";
					   $html .= "<tr><td>&nbsp;" . $row["AgncyFax"] . "</td></tr></table></div>";
					   $html .= "<div class='agents_list'><h3>AGENTS</h3><hr class='style-two'>";
					   
					   
					   
					   while($row1 = mysqli_fetch_assoc($result1))
					   {
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
				   
				   print($html);
				   mysqli_close($link);
				   ?>
				   
                   
                
                
       
         </div> <!-- End of body -->
        </div> <!-- End of Container -->
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>