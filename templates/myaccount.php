<?php include 'db.php'?>
<?php include "header.php" ?>

<?php
    if ( isset($_POST['old']) && isset($_POST['new']) && isset($_POST['confirm']) ) {
        $id = mysql_real_escape_string($_SESSION['id']);
		$old = mysql_real_escape_string($_POST['old']);
		$new = mysql_real_escape_string($_POST['new']);
		$confirm = mysql_real_escape_string($_POST['confirm']);
		$newstripped = preg_replace("/[^a-zA-Z0-9]/", "", $new);
		if ( $new != $confirm ) {
			$_SESSION['error'] = 'New & Confirm Password entries do not match, please try again.';
		} elseif ( $new != $newstripped ) {
			$_SESSION['error'] = 'Passwords must consist of only letters and numbers, please try again.';
		} elseif ( strlen($new) < 8 ) {
			$_SESSION['error'] = 'Passwords must be at least eight characters long, please try again.';
		} elseif ( strlen($new) > 15 ) {
			$_SESSION['error'] = 'Passwords can be no longer than fifteen characters, please try again.';
		} else {
			$sql1 = "SELECT password FROM user WHERE id = $id";
			$result1 = mysql_query($sql1);
			if ( $result1 === FALSE ) {
				$_SESSION['error'] = 'Wrong username or password';
			} else {
				$row1 = mysql_fetch_row($result1);
				$_SESSION['password'] = $row1[0];
				if ( $_SESSION['password'] != $old ) {
					unset($_SESSION['password']);
					$_SESSION['error'] = 'Old Password entry is not correct, please try again.';
				} else {
					$sql2 = "UPDATE `user` SET `password`= '$new' WHERE `id` = $id";
					$result2 = mysql_query($sql2);
					if ( $result2 === TRUE ) {
						unset($_SESSION['password']);
						$_SESSION['success'] = 'Password Changed!';
					} else {
						unset($_SESSION['password']);
						$_SESSION['error'] = 'Password Change failed, please try again or contact an administrator.';
						}
					}
			}
		}
	}	
?>

<div id='pwchange'>

<form method="post">
<h3>Change Password</h3>
<p>Old Password:
<input type="text" name="old"></p>
<p>New Password:
<input type="text" name="new"></p>
<p>Confirm Password:
<input type="text" name="confirm"></p>
<p><input type="submit" value="Login"/>
</form>

</div>

<?php
if ( isset($_SESSION['error']) ) {
    echo '<p style="color:red; text-align:center;">'.$_SESSION['error']."</p>\n";
    unset($_SESSION['error']);
}

if ( isset($_SESSION['success']) ) {
    echo '<p style="color:green; text-align:center;">'.$_SESSION['success']."</p>\n";
    unset($_SESSION['success']);
}
?>


<?php include "footer.php" ?>
