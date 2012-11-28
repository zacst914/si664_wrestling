<?php
session_start();
if(!isset($_SESSION['username'])) {
	header("location:main_login.php");
	return;
}
else {
	header("location:announcements.php");
	return;
}
?>
