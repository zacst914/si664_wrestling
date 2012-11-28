<?php include 'base_loggedout.php' ?>

<?php startblock ('title') ?>
    <title>Log In</title>
<?php endblock() ?>

<?php startblock ('content') ?>
<div id="login">
<p>
<table width="300" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<form name="form1" method="post" action="checklogin.php">
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="3"><strong>Member Login </strong></td>
</tr>
<tr>
<td width="78">Username</td>
<td width="6"></td>
<td width="294"><input name="myusername" type="text" id="myusername"></td>
</tr>
<tr>
<td>Password</td>
<td></td>
<td><input name="mypassword" type="text" id="mypassword"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Login"></td>
</tr>
</table>
</td>
</form>
</tr>
</table>
</div>
</p>
<?php

session_start();

if ( isset($_SESSION['error']) ) 
	{
		echo '<b><p style="color:red; text-align:center;">'.$_SESSION['error']."</p></b>\n";
		unset($_SESSION['error']);
	}
?>
<?php endblock() ?>