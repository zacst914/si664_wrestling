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

?>
</table>
<p></p>
<table>
    <tr>
        <th>Rank</th>
        <th>Name</th>
        <th>Record</th>
        <th>Pins</th>
        <th>Takedowns</th>
        <th>Nearfalls</th>
        <th>Stalls For</th>
        <th>Stalls Against</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Dan Yates</td>
        <td>15-2</td>
        <td>7</td>
        <td>32</td>
        <td>12</td>
        <td>8</td>
        <td>0</td>
    </tr>
</table>

</div>


<?php endblock() ?>