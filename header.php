<!-- header.php page 
Author Name: John Nguyen
Creation Date: November 7th, 2014
Course: OOSD Fall 2014
Description: Displaying dynamic navigation menu depending on the PHP Sessions
//-->
<?php
    date_default_timezone_set("america/edmonton"); //setting default time zone for Calgary
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <title>Travel Experts Inc. | <?php print($title); ?></title>
        <meta name="description" content="SAIT Fall 2014 Object-Oriented Software Development Project #1 (HTML, CSS, JavaScript, PHP & MySQL)">
        <meta name="author" content="John Nguyen, Megha Patel, Brian Pang, Mahmood Qureshi">
        
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript" src="js/default.js"></script>
        
        <!-- Stylesheets -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome-4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/transitions.css">
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
        
        <!-- Google Font Code -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:700,600,400|Ek+Mukta:400,600,700|Sintony:700' rel='stylesheet' type='text/css'>
        
    </head>
    <body>
        <div class="header_wrap">
            <div class="header">
            <div class="logo"><a href="index.php"><img src="img/logo.png" class="img-responsive"></a></div>
            <div class="nav" id="dropmenu">
                <ul>
                    <a href="index.php"><li class="home"><i class="fa fa-home fa-lg"></i></li></a>
                    <a href="packages.php"><li>&nbsp;<i class="fa fa-plane"></i> &nbsp;Vacations&nbsp;</li></a>
                    <?php
                        if (!isset($_SESSION['loggedin'])) {
                          echo"  <li><i class='fa fa-sign-in'></i> &nbsp;Login&nbsp;&nbsp;&nbsp;
                                    <ul>
                                        <a href='registration.php'><li class='active_nav'><i class='fa fa-sign-in'></i> &nbsp;Login&nbsp;&nbsp;&nbsp;</li></a>
                                        <a href='logout.php'><li class='logout'><i class='fa fa-sign-out'></i> &nbsp;Logout</li></a>
                                    </ul>
                                </li>";
                        } else {
                          echo"  <li><i class='fa fa-user'></i> &nbsp;Account
                                    <ul>
                                        <a href='customer.php'><li class='active_nav'><i class='fa fa-user'></i> &nbsp;Account</li></a>
                                        <a href='logout.php'><li class='logout'><i class='fa fa-sign-out'></i> &nbsp;Logout</li></a>
                                    </ul>
                                </li>";  
                            
                        }
                    ?>
                    <a href="contact.php"><li>&nbsp;<i class="fa fa-info-circle"></i> &nbsp;About Us&nbsp;</li></a>
                </ul>
            </div>
            <div class="nav_mobile" onclick="dropMenu('dropmenu');">
               <i class="fa fa-bars fa-2x"></i>
            </div>
        </div>
        </div>
        <div class="slider" style="background-image: url(img/slider<?php print($slider); ?>.jpg);"> <!-- Slider Image -->
             <div class="welcome">
                 <h1><strong><?php print($display); ?></strong></h1>
            </div>      
        </div>
        <div>
            <a href="#help" class="help"><i class="fa fa-question-circle fa-lg"></i></a>
        </div>
        <div>
            <a href="#lang" class="lang" onclick="dropMenu('flags');"><img src="img/flags/Canada.png" style="margin-right: 10px;"><i class="fa fa-caret-down"></i></a>
        </div>
        <div class="lang_menu" id="flags" onClick="document.getElementById('flags').style.display='none';">
            <ul>
                <li><img src="img/flags/Canada.png"> <strong>EN</strong></li>
                <li><img src="img/flags/France.png"> <strong>FR</strong></li>
                <li><img src="img/flags/Germany.png"> <strong>GE</strong></li>
                <li><img src="img/flags/Japan.png"> <strong>JA</strong></li>
                <li><img src="img/flags/China.png"> <strong>CN</strong></li>
                <li><img src="img/flags/Brazil.png"> <strong>BP</strong></li>
                <li><img src="img/flags/Italy.png"> <strong>IT</strong></li>
                <li><img src="img/flags/Russia.png"> <strong>RU</strong></li>
            </ul>
        </div>