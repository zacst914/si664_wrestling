<?php include 'base.php' ?>
<?php 
    require_once "print.php";
?>


<?php startblock ('title') ?>
<title>Statistics</title>
<?php endblock() ?>

<?php startblock ('content') ?>

<script type="text/javascript">
function print_overall_table() {
    document.getElementById('stats_table').innerHTML = "<?php $match_header = array('Rank', 'Lastname', 'Firstname', 'Wins', 'Losses', 'Pins', 'Takedowns', '3pt Nearfalls', '2pt Nearfalls', 'Stalls For','Stalls Against'); print_header($match_header); $cat_arr = array('lastname', 'firstname', 'wins', 'losses', 'pins', 'takedowns','nearfall3pt', 'nearfall2pt', 'stalls_opp', 'stalls'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>"
}

function print_takedown_table() {
    document.getElementById('stats_table').innerHTML = "<?php $takedown_header = array('Rank', 'Lastname', 'Firstname', 'For', 'Against','1st For', '1st Against'); print_header($takedown_header); $cat_arr = array('lastname', 'firstname', 'takedowns', 'takedowns_opp', 'firsttakedowns', 'firsttakedowns_opp'); usort($wrestler_array, 'cmp_takedowns'); print_table($cat_arr, $wrestler_array); ?>"
}

function print_top_table() {
    document.getElementById('stats_table').innerHTML = "<?php $top_header = array('Rank', 'Lastname', 'Firstname', 'Pins', 'Pins Against', '3pt Nearfalls', '2pt Nearfalls', 'Riding Times','Riding Times Against'); print_header($top_header); $cat_arr = array('lastname', 'firstname', 'pins', 'pins_opp', 'nearfall3pt', 'nearfall2pt','ridingtimepts', 'ridingtimepts_opp'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>"
}

function print_bottom_table() {
    document.getElementById('stats_table').innerHTML = "<?php $bottom_header = array('Rank', 'Lastname', 'Firstname', 'Escapes', 'Escapes Against', 'Reversals', 'Reversals Against'); print_header($bottom_header); $cat_arr = array('lastname', 'firstname', 'escapes', 'escapes_opp', 'reversals', 'reversals_opp'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>"
}

function print_penalties_table() {
    document.getElementById('stats_table').innerHTML = "<?php $penalties_header = array('Rank', 'Lastname', 'Firstname','Stalls For', 'Stalls Against', 'Stall Pts For', 'Stall Pts Against', 'Cautions', 'Cautions Opp', 'Caution Pts', 'Caution Pts Against'); print_header($penalties_header); $cat_arr = array('lastname', 'firstname', 'stalls_opp', 'stalls', 'stallpts', 'stallpts_opp', 'caution', 'caution_opp', 'cautionpts', 'cautionpts_opp'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>"
}

function print_team_table() {
    document.getElementById('stats_table').innerHTML = "<?php $team_header = array('Rank', 'Lastname', 'Firstname','Pins', 'Pins Against', 'Tech Falls', 'Tech Falls Against', '4 Pt TF', '4 Pt TF Against', 'Majors', 'Majors Against', 'Decisions', 'Decisions Against'); print_header($team_header); $cat_arr = array('lastname', 'firstname', 'pins', 'pins_opp', 'techfall', 'techfall_opp', 'techfall4pt', 'techfall4pt_opp', 'majors', 'majors_opp', 'decisions', 'decisions_opp'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>"
}
</script>


<h1>Statistics</h1>
    <div id="statsbar">
        <a href="#" onclick="print_overall_table();">Overall</a>
        <a href="#" onclick="print_team_table();">Team Scoring</a>
        <a href="#" onclick="print_takedown_table();">Takedowns</a>
        <a href="#" onclick="print_top_table();">Top</a>
        <a href="#" onclick="print_bottom_table();">Bottom</a>
        <a href="#" onclick="print_penalties_table();">Penalties</a>
        <a href="#">Other</a>
    </div>
    <div id="stats_table">
<?php
        $match_header = array('Rank', 'Lastname', 'Firstname', 'Wins', 'Losses', 
                      'Pins', 'Takedowns', '3pt Nearfalls', '2pt Nearfalls', 
                      'Stalls For', 'Stalls Against');

        print_header($match_header);

        $cat_arr = array('lastname', 'firstname', 'wins', 'losses', 'pins', 'takedowns',
                 'nearfall3pt', 'nearfall2pt', 'stalls_opp', 'stalls');

        usort($wrestler_array, "rank");
        print_table($cat_arr, $wrestler_array);
?>
    </div>


<?php endblock() ?>