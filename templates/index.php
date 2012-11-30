<?php 
    session_start();
    include 'loggedout_header.php' 
?>

<?php
    if ( isset($_SESSION['error']) ) {
        echo '<p style="color:red">'.$_SESSION['error']."</p>\n";
        unset($_SESSION['error']);
    }
?>


<?php include 'loggedout_footer.php' ?>
