
<?php
	function dcr()
	{date_default_timezone_set("america/edmonton"); //setting default time zone for Calgary

	
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
	if ('.$row["PkgStartDate"].' < $date)
	{
		echo "<h3 style='color:red'>".$row["PkgStartDate"]."</h3>";
		
	}
	
	else
	{
		 echo  "<h4 style='color:black'>".$row["PkgStartDate"]."</h4>";
	}
}	
										} 
else {
    echo "0 results";
}
$conn->close();
}
dcr();
?>
