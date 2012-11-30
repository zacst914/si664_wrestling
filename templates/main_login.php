<?php include 'db.php'?>
<?php
    session_start();
    if ( isset($_POST['username']) && isset($_POST['password'])  ) {
        $u = mysql_real_escape_string($_POST['username']);
        $p = mysql_real_escape_string($_POST['password']);
        $sql = "SELECT uniqname FROM user WHERE uniqname='$u' AND password='$p'";
        $result = mysql_query($sql);
        $row = mysql_fetch_row($result);	
        if ( $row === FALSE ) {
            unset($_SESSION['username']);
        } else { 
            $_SESSION['username'] = $row[0];
        }
    }
    if ( isset($_SESSION['username']) ) {
        header( "Location: announcements.php"); 
        return;
    }
?>

<?php include 'loggedout_header.php' ?>

<div id="login">


<form method="post">
<h3>Member Login</h3>
<p>Username
<input type="text" name="username"></p>
<p>Password
<input type="password" name="password"></p>
<p><input type="submit" value="Login"/>
</form>

</div>

<?php include 'loggedout_footer.php' ?>
