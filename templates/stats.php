<?php include 'base.php' ?>
<?php 
    require_once "db.php"; 
?>


<?php startblock ('title') ?>
<title>Statistics</title>
<?php endblock() ?>

<?php startblock ('content') ?>
<h1>Statistics</h1>
<div id="statsbar">
<p> <span id="overall">Overall</span>
<span id="record">Record</span>
<span id="pins">Pins</span>
<span id="takedowns">Takedowns</span>
<span id="nearfall">Nearfall</span>
<span id="stalls">Stalls</span>
<span id="other">Other</span></p>
</div>

<div>

    <table>
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Pins</th>
        </tr>
<?php 
    
    //queries all matches that have pins
    $query = mysql_query("SELECT user.firstname, user.lastname, user.id, bout.bout_id FROM user, bout WHERE user.id = bout.user_id AND bout.pin=1");
    
    //Initiate and fill one array for number of pins and one for the names of wrestler
    $pins = array();
    $names = array();
    while ( $wrestler = mysql_fetch_row($query) ) {
        if (array_key_exists($wrestler[2], $pins)) {
            $pins[$wrestler[2]]++;
        }
        else {
            $wrestler_name = $wrestler[0] . " " . $wrestler[1];
            $names[$wrestler[2]] = $wrestler_name;
            $pins[$wrestler[2]] = 1;
        }
    }
    
    //Combines the above arrays to make them have [name]=> value relationship
    $pin_table = array();
    foreach ($pins as $i => $nums) {
        foreach($names as $j => $value) {
            if ($i == $j) {
                $pin_table[$value]=$nums;
            }
        }
    }
    arsort($pin_table);

    //Fills the table with the correct data
    $rank = 1;
    foreach ($pin_table as $k => $pins) {
        echo ("<tr><td>");
        echo $rank;
        echo("</td><td>");
        echo $k;
        echo("</td><td>");
        echo $pins;
        echo("</td></tr>\n");
        $rank++;
    }
    echo "</table>";

?>
<p></p>

<table>
    <tr>
        <th>Rank</th>
        <th>Name</th>
        <th>Wins</th>
        <th>Losses</th>
    </tr>
<?php
    //query to get record
    $win_query = mysql_query("SELECT user.firstname, user.lastname, user.id, bout.bout_id FROM user, bout WHERE user.id = bout.user_id AND bout.win=1");
    
    $loss_query = mysql_query("SELECT user.firstname, user.lastname, user.id, bout.bout_id FROM user, bout WHERE user.id = bout.user_id AND bout.win=0");
    
    $wins = array();
    $win_names = array();
    while ( $win_wrestler = mysql_fetch_row($win_query) ) {
        if (array_key_exists($win_wrestler[2], $wins)) {
            $wins[$win_wrestler[2]]++;
        }
        else {
            $wrestler_name = $win_wrestler[0] . " " . $win_wrestler[1];
            $win_names[$win_wrestler[2]] = $wrestler_name;
            $wins[$win_wrestler[2]] = 1;
        }
    }
    
    $losses = array();
    $loss_names = array();
    while ( $loss_wrestler = mysql_fetch_row($loss_query) ) {
        if (array_key_exists($loss_wrestler[2], $losses)) {
            $losses[$loss_wrestler[2]]++;
        }
        else {
            $wrestler_name = $loss_wrestler[0] . " " . $loss_wrestler[1];
            $loss_names[$loss_wrestler[2]] = $wrestler_name;
            $losses[$loss_wrestler[2]] = 1;
        }
    }
    
    $win_table = array();
    foreach ($wins as $i => $nums) {
        foreach($win_names as $j => $value) {
            if ($i == $j) {
                $win_table[$value]=$nums;
            }
        }
    }
    
    $loss_table = array();
    foreach ($losses as $i => $nums) {
        foreach($loss_names as $j => $value) {
            if ($i == $j) {
                $loss_table[$value]=$nums;
            }
        }
    }
    
    
    arsort($win_table);
    asort($loss_table);
    $rank = 1;
    foreach ($win_table as $i => $wins) {
        if (!array_key_exists($i, $loss_table)) {
            echo ("<tr><td>");
            echo $rank;
            echo("</td><td>");
            echo $i;
            echo("</td><td>");
            echo $wins;
            echo("</td><td>");
            echo '0';
            echo("</td></tr>\n");
            $rank++;
            continue;
        }
    }
    
    foreach ($win_table as $i => $wins) {
        if (array_key_exists($i, $loss_table)) {
            foreach($loss_table as $j => $losses) {
                if ($i == $j) {
                    echo ("<tr><td>");
                    echo $rank;
                    echo("</td><td>");
                    echo $i;
                    echo("</td><td>");
                    echo $wins;
                    echo("</td><td>");
                    echo $losses;
                    echo("</td></tr>\n");
                    $rank++;
                    continue;
                } 
            }
        }
    }
    
    
    foreach ($loss_table as $j => $losses) {
        if (!array_key_exists($j, $win_table)) {
            echo ("<tr><td>");
            echo $rank;
            echo("</td><td>");
            echo $j;
            echo("</td><td>");
            echo "0";
            echo("</td><td>");
            echo $losses;
            echo("</td></tr>\n");
            $rank++;
            continue;
        }
    }
    
    
    echo "</table>";
    echo "<p></p>";
    echo "</div>";
    
?>

<?php endblock() ?>