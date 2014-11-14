<?php

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
	$date = date("Y-m-d");

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
     //   die("Connection failed: " . $conn->connect_error);
    } 

    $sql = "SELECT PkgStartDate, PkgEndDate FROM packages";
    $result = $conn->query($sql);

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
    $conn->close();
}
?>