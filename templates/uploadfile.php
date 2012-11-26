<html>
<body>
<?php

$path = "wdata.csv";

if(move_uploaded_file($_FILES['userfile']['tmp_name'], $path))
	{
	$command = "python import.py 2>&1";
	$pid = popen( $command, "r");
	while( !feof( $pid ) )
		{
		echo fread($pid, 256);
		flush();
		ob_flush();
		usleep(100000);
		}
	pclose($pid);
	unlink($path);
	}
else
	{
	echo "Error when uploading file.";
	}
?>
</body>
</html>