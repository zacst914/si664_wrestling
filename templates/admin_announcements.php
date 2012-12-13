<?php include "admin_header.php" ?>

<?php
    require_once "db.php";
    $userid = $_SESSION['id'];
    if ( isset($_POST['title']) && isset($_POST['comment'])  ) {
        $title = mysql_real_escape_string($_POST['title']);
        $comment = mysql_real_escape_string($_POST['comment']);
        $sql = "INSERT INTO `announcement`(`user_id`, `title`, `comment`) VALUES ('$userid', '$title', '$comment')";
        $query = mysql_query($sql);
        if($query === FALSE) {
            die(mysql_error());
        }
    }
    
?>
<div id='make_ann'>
<h2>Make an Announcement</h2>
<form method="post" action="admin_announcements.php">
<h3>Title:</h3><input type="text" name="title" required="requiered">
<h3>Comment:</h3><textarea name="comment" rows="10" cols="40" required="requiered"></textarea>
<p><input type="submit" value="Post"></p>
</form>
</div>
<?php
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