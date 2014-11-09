<?php
function verifyLogin($u, $p) {
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
?>