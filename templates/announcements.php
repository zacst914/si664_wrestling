<?php include "header.php" ?>

<?php
    require_once "db.php";
    $query = mysql_query("SELECT user.firstname, user.lastname, announcement.time, announcement.title, announcement.comment FROM user, announcement WHERE user.id = announcement.user_id ORDER BY announcement.id DESC LIMIT 50");
    
    if($query === FALSE) {
        die(mysql_error());
    }
    echo "<div id='announcements'>";
    
    while ($result = mysql_fetch_row($query)) {
        $timestamp = $result[2];
        $time = date('g:i:s', strtotime($timestamp));
        $date = date('l, M d, Y', strtotime($timestamp));
        
        echo "<hr><h3>";
        echo $result[3];
        echo "</h3><h4>";
        echo $result[4];
        echo "</h4><p>by: ";
        echo $result[0];
        echo " ";
        echo $result[1];
        echo " at ";
        echo $time;
        echo " on ";
        echo $date;
        echo "</p>";
    }
    
    echo "</div>";
    
    
    ?>

<?php include "footer.php" ?>