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
            <!--Google Map Style-->
		<style>
        #map-canvas {
                     height: 300px;
                     width:300px;
                     }
        </style>
		
		<!--define Google map for agencies position -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
        <script>
           function initialize() {
              var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
              var myLatlng1 = new google.maps.LatLng(20.363882,100.086612);
              var mapOptions = {
              zoom: 1,
              center: myLatlng
              }
              var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

              var marker = new google.maps.Marker({
                 position: myLatlng,
                 map: map,
                 title: 'Agency 1587968'
              });
  
              var marker1 = new google.maps.Marker({
                 position: myLatlng1,
                 map: map,
                 title: 'Agency 2'
              });
            }

            google.maps.event.addDomListener(window, 'load', initialize);

        </script> 
            <!-- Main body begins here -->
            <div id="body">

                <!---display Google Map-->
                <div id="map-canvas"></div>  
                   <!--- Main Contact information begins here--> 
                   
					 <?php
					   $html ="<table cellspacing='0' cellpadding='1' border='1' width='300' ><thead><tr><th>Agencies</th><th>Agents</th></tr></thead><tbody style='height:48px; overflow:auto;'>";
					   $link=mysqli_connect("localhost","root","","travelexperts") or 
	                         die("Connect error:". mysqli_connect_error());
	                         $table="agencies";
							 $sql = "select * from agencies";
							 $result = mysqli_query($link,$sql);
							 
							 if(mysqli_num_rows($result)>0)
							 {
							    while($row = mysqli_fetch_assoc($result))
								{
								   
								   $sql1 = "select * from agents where AgencyId=" . $row["AgencyId"];
								   $result1  = mysqli_query($link,$sql1);
								   $html .="<tr><td rowspan=" . mysqli_num_rows($result1) . ">"
                                         . $row["AgncyAddress"] ."<br>" . $row["AgncyCity"] .
								          "<br>" . $row["AgncyProv"] . "<br>" . $row["AgncyPostal"] . "<br>" . $row["AgncyCountry"] .
										  "<br>" . $row["AgncyPhone"] . $row["AgncyFax"] . "</td>";
								   $row1 = mysqli_fetch_assoc($result1);
								   $html .= "<td>" . $row1["AgtFirstName"] . " " . $row1["AgtMiddleInitial"] . " " . $row1["AgtLastName"] . "<br>"
								            . $row1["AgtBusPhone"] . "<br>" . $row1["AgtEmail"] . "<br>" . $row1["AgtPosition"] . "</td></tr>";
								   while($row1 = mysqli_fetch_assoc($result1))
								   {
								    $html .=  "<td>" . $row1["AgtFirstName"] . " " . $row1["AgtMiddleInitial"] . " " . $row1["AgtLastName"] . "<br>"
								            . $row1["AgtBusPhone"] . "<br>" . $row1["AgtEmail"] . "<br>" . $row1["AgtPosition"] . "</td></tr>";
								   }
								   $html .= "</tr>";
								   
								}
								$html .= "</tbody></table>";
								print($html);
								mysqli_close($link);
							 }
							 
					 ?>
				
        </div> <!-- End of Container -->
	
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>