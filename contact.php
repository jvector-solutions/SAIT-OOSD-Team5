<!-- contacts.php page 
Author Name: Brian Peng
Creation Date: November 5th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic information for contact page
//-->

<?php
    include('header.php');
?>
        <div class="container-fluid"> <!-- Start of Container -->
            <!--Google Map Style-->
	<!--	<style>
        #map-canvas {
                     height: 300px;
                     width:300px;
                     }
        </style>
		
		<!--define Google map for agencies position --
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

        </script> //-->
            <!-- Main body begins here -->
            <div id="body">

                <!---display Google Map-->
            <!--    <div id="map-canvas"></div>  //-->
                   <!--- Main Contact information begins here --->
                   <table cellspacing="0" cellpadding="1" border="1" width="300" >
                     <thead>
                        <tr>
                          <th>Agencies</th>
                          <th>Agents</th>
                        </tr>
                     </thead>
                     <tbody style="height:48px; overflow:auto;">
                       <tr>
                         <td rowspan="4">AgencyAddress <br>AgencyCity<br>AgencyProv<br>AgncyPostal<br>AgncyCountry><br>AgtPosition</td>
                         <td >Tom TH. Smith<br> (587)9686733<br>tom@gmail.com<br>junior</td>
                       </tr>
                       <tr>

                         <td >Anny  Wood<br> (587)96865555<br>anny@gmail.com<br>senior</td>
                       </tr>
                       <tr>

                         <td >Tom TH. Smith<br> (587)9686733<br>tom@gmail.com<br>junior</td>
                       </tr>
                       <tr>

                         <td >Tom TH. Smith<br> (587)9686733<br>tom@gmail.com<br>junior</td>
                       </tr>
                       <tr>
                         <td rowspan="2">24 39 street <br>AgencyCity<br>AgencyProv<br>AgncyPostal<br>AgncyCountry><br>AgtPosition</td>
                         <td >Tom TH. Smith<br> (587)9686733<br>tom@gmail.com<br>junior</td>
                       </tr>
                       <tr>

                         <td >Tom TH. Smith<br> (587)9686733<br>tom@gmail.com<br>junior</td>
                       </tr>
                     </tbody>
                   </table>
                
                
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>