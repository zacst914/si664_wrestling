<?php
session_start();
if(!isset($_SESSION['username'])) {
	header("location:main_login.php");
	return;
}
else {
	header("location:index_loggedin.php");
	return;
}
?>
