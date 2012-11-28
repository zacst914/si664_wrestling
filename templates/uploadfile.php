<?php

	session_start();
	$path = "wdata.csv";

	$csv_types = array('text/csv', 'text/plain', 'application/csv', 'text/comma-separated-values', 'application/excel', 'application/vnd.ms-excel', 'application/vnd.msexcel', 'text/anytext', 'application/octet-stream', 'application/txt');

	if (in_array($_FILES['userfile']['type'], $csv_types))
	{
		if(move_uploaded_file($_FILES['userfile']['tmp_name'], $path))
			{
			$command = "python import.py";
			
			exec($command, $output);
			
			unlink($path);
			
			$_SESSION['success'] = "Upload Successful!";
			$_SESSION['usercount'] = $output[0];
			$_SESSION['classcount'] = $output[1];
			$_SESSION['boutcount'] = $output[2];
			
			header( 'Location: upload.php' ) ;
			unlink($_FILES['userfile']['tmp_name']);
			return;
			}
			
		else
			{
			unlink($path);
			echo "Error when uploading file, please try again!";
			}
	}
    else
    {
        $_SESSION['error'] = "Uploaded file is not a CSV, please check the file and try again!";
        header( 'Location: upload.php' ) ;
        unlink($_FILES['userfile']['tmp_name']);
		return;
    }

?>
