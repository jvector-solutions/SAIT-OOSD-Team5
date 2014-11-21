<?php

// Written by John
function bookingNumber($chars,$nums) {
	$letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";	
    $numbers = "0123456789";
    $str = "";
	for( $i = 0; $i < $chars; $i++ ) {
		$str .= $letters[ rand( 0, 26 - 1 ) ];
	}
    for ($j = 0; $j < $nums; $j++) {
        $str .= $numbers[ rand( 0, 10 - 1 )];
    }

	return $str;
}	

// Function verifyLogin() written by John
function verifyLogin($u,$p) {
    $link = mysqli_connect("localhost","root","","travelexperts") or die("Error: " . mysqli_connect_error());
    $sql = "SELECT password FROM users WHERE userid='$u'";
    $result = mysqli_query($link, $sql) or die("SQL Error:" . mysqli_error());
    if ($pwd = mysqli_fetch_row($result)) {
        if ($pwd[0] == $p) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
    mysqli_close($link);
}

// Written by Megha
function insertCustomer($custData) {
    //customer data..
    $sql = "INSERT INTO customers VALUES (NULL,'$custData[CustFirstName]','$custData[CustLastName]','$custData[CustAddress]','$custData[CustCity]','$custData[CustProv]','$custData[CustPostal]','$custData[CustCountry]','$custData[CustHomePhone]','$custData[CustBusPhone]','$custData[CustEmail]',NULL);";
    $sql2 = "INSERT INTO users VALUES ('$custData[CustEmail]','$custData[password2]');";
    //create connection
    $link = mysqli_connect("localhost","root","","travelexperts") or die("Error: " . mysqli_connect_error());
    //check connection
    $result = mysqli_query($link,$sql) or die("query Error:" . mysqli_error($link));
    $result2 = mysqli_query($link,$sql2) or die("query Error:" . mysqli_error($link));
    mysqli_close($link);
    return $result;	
}

// Written by Mahmood
function dcr() {
    date_default_timezone_set("america/edmonton"); //setting default time zone for Calgary
	
	$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "travelexperts";
	$date = date("Y-m-d"); //getting current date in the format matching in the travel experts database.

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error); //display error if there is no connection to DB
    } 

    $sql = "SELECT PkgStartDate, PkgEndDate FROM packages";
    $result = $conn->query($sql); //passing the sql query results to result variable

    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            if ('.$row["PkgStartDate"].' < $date) {
                echo "<h3 style='color:red'>".$row["PkgStartDate"]."</h3>";
            } else {
                echo  "<h4 style='color:black'>".$row["PkgStartDate"]."</h4>";
            }
        }	
    } 
    else {
        echo "0 results";
    }
    $conn->close(); //closing connection to database
}
?>