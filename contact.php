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
                <div class="row style agency">
                    <div class="agency_map">
                        <img src="img/agency01.png" style="max-width: 100%;">
                    </div>
                    <div class="agency_address">
                        <h3>AGENCY 1</h3><hr class="style-two">
                        <table>
                            <tr>
                                <td rowspan="5" style="vertical-align: top;"><i class="fa fa-map-marker fa-2x"></i></td>
                                <td><strong>Address</strong></td>
                            </tr>
                            <tr><td>1155 8th Avenue SW</td></tr>
                            <tr><td>Calgary, AB</td></tr>
                            <tr><td>T2P 1N3</td></tr>
                            <tr><td>Canada</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                            <td rowspan="2" style="vertical-align: top;"><i class="fa fa-phone fa-2x"></td>
                            <td><strong>Telephone</strong></td></tr>
                        <tr><td>&nbsp;(403) 271-9873</td>
                        </tr><tr>
                            <td rowspan="2" style="vertical-align: top;"><i class="fa fa-fax fa-lg"></i></td>
                            <td><strong>Fax</strong></td></tr>
                            <tr><td>&nbsp;(403) 271-9872</td>
                        </tr></table>
                    </div>
                    <div class="agents_list">
                        <h3>AGENTS</h3><hr class="style-two">

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Tom Smith</h3>, <em>Junior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(587) 968-6733</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:tom@gmail.com">tom@gmail.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Anny Wood</h3>, <em>Senior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(587) 968-6555</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:anny@gmail.com">anny@gmail.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Janet Delton</h3>, <em>Senior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(403) 210-7801</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:janet.delton@travelexperts.com">janet.delton@travelexperts.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Judy Lisle</h3>, <em>Intermediate Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(403) 210-7802</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:judy.lisle@travelexperts.com">judy.lisle@travelexperts.com</a></td>
                            </tr></table>
                        </div>

                    </div>
                </div>
                <!-- END Agency Information Row //-->
                
                <!-- BEGIN Agency Information Row //-->
                <div class="row style agency">
                    <div class="agency_map">
                        <img src="img/agency01.png" style="max-width: 100%;">
                    </div>
                    <div class="agency_address">
                        <h3>AGENCY 1</h3><hr class="style-two">
                        <table>
                            <tr>
                                <td rowspan="5" style="vertical-align: top;"><i class="fa fa-map-marker fa-2x"></i></td>
                                <td><strong>Address</strong></td>
                            </tr>
                            <tr><td>1155 8th Avenue SW</td></tr>
                            <tr><td>Calgary, AB</td></tr>
                            <tr><td>T2P 1N3</td></tr>
                            <tr><td>Canada</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                            <td rowspan="2" style="vertical-align: top;"><i class="fa fa-phone fa-2x"></td>
                            <td><strong>Telephone</strong></td></tr>
                        <tr><td>&nbsp;(403) 271-9873</td>
                        </tr><tr>
                            <td rowspan="2" style="vertical-align: top;"><i class="fa fa-fax fa-lg"></i></td>
                            <td><strong>Fax</strong></td></tr>
                            <tr><td>&nbsp;(403) 271-9872</td>
                        </tr></table>
                    </div>
                    <div class="agents_list">
                        <h3>AGENTS</h3><hr class="style-two">

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Tom Smith</h3>, <em>Junior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(587) 968-6733</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:tom@gmail.com">tom@gmail.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Anny Wood</h3>, <em>Senior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(587) 968-6555</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:anny@gmail.com">anny@gmail.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Janet Delton</h3>, <em>Senior Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(403) 210-7801</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:janet.delton@travelexperts.com">janet.delton@travelexperts.com</a></td>
                            </tr></table>
                        </div>

                        <!-- Agent information //-->
                        <div class="agent">
                            <h3>Judy Lisle</h3>, <em>Intermediate Agent</em><br>
                            <table><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-phone"></td>
                                <td>(403) 210-7802</td>
                            </tr><tr>
                                <td>&nbsp;</td>
                                <td><i class="fa fa-envelope-o"></i></td>
                                <td><a href="mailto:judy.lisle@travelexperts.com">judy.lisle@travelexperts.com</a></td>
                            </tr></table>
                        </div>

                    </div>
                </div>
                <!-- END Agency Information Row //-->
                
                
       
            </div> <!-- End of body -->
        </div> <!-- End of Container -->
        <div id="footer">
            <br><p>Copyright &copy; 2014 Travel Experts Inc. All rights reserved.</p>
        </div>
        <a href="#top" class="top"><i class="fa fa-arrow-up fa-lg"></i></a>
    </body>
</html>