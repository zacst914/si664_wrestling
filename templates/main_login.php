<?php include 'db.php'?>
<?php
    session_start();
    if ( isset($_POST['username']) && isset($_POST['password'])  ) {
        $u = mysql_real_escape_string($_POST['username']);
        $p = mysql_real_escape_string($_POST['password']);
        $sql = "SELECT uniqname, account_type FROM user WHERE uniqname='$u' AND password='$p'";
        $result = mysql_query($sql);
        $row = mysql_fetch_row($result);	
        if ( $row === FALSE ) {
            unset($_SESSION['username']);
            $_SESSION['error'] = 'Wrong username or password';
        } else { 
            $_SESSION['username'] = $row[0];
            $_SESSION['acct_type'] = $row[1];
        }
    }
    if ( isset($_SESSION['username']) && $_SESSION['acct_type'] == 0 ) {
        header( "Location: announcements.php"); 
        return;
    } elseif ( isset($_SESSION['username']) && $_SESSION['acct_type'] == 1 ) {
        header( "Location: admin.php");
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
<?php
if ( isset($_SESSION['error']) ) {
    echo '<p style="color:red; text-align:center;">'.$_SESSION['error']."</p>\n";
    unset($_SESSION['error']);
}
?>
<?php include 'footer.php' ?>
