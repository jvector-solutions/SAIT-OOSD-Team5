<?php
session_start();

unset($_SESSION['view']); //to delete a single session

session_destroy(); //to delete all session

?>
