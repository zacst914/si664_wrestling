<?php include 'base.php' ?>

<?php startblock ('title') ?>
<title>MWrestling - Upload</title>
<?php endblock() ?>

<?php startblock ('content') ?>

	<div id="upload">
	
	<?php
	
	session_start();
		
	if ( isset($_SESSION['error']) ) 
	{
		echo '<b><p style="color:red">'.$_SESSION['error']."</p></b>\n";
		unset($_SESSION['error']);
	}
	
		if ( isset($_SESSION['success']) ) 
	{
		echo '<b><p style="color:green">'.$_SESSION['success']."</p></b>";
		echo '<b><h4 style="text-indent:70px">Users Added:</b> '.$_SESSION['usercount'].'<br></h4>';
		echo '<b><h4 style="text-indent:70px">Users Updated:</b> '.$_SESSION['classcount'].'<br></h4>';
		echo '<b><h4 style="text-indent:70px">Bouts Added:</b> '.$_SESSION['boutcount'].'<br></h4>';
		unset($_SESSION['success']);
	}
	?>
	
	<p>
		<form enctype="multipart/form-data" action="uploadfile.php" method="POST">
		<b>1. Select the CSV File:</b>
	</p>
	<p>
		<input name="userfile" type="file"/>
	</p>
	<p>
		<b>2. Upload the File:</b>
	</p>
	<p>
		<input type="submit" value="Upload File"/>
	</p>
	</form>
	</div>
<?php endblock() ?>