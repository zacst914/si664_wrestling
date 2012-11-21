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
    document.getElementById('stats_table').innerHTML = "<?php $match_header = array('Rank', 'Lastname', 'Firstname', 'Wins', 'Losses', 'Pins', 'Takedowns', '3pt Nearfalls', '2pt Nearfalls', 'Stalls For','Stalls Against'); print_header($match_header); $cat_arr = array('lastname', 'firstname', 'wins', 'losses', 'pins', 'takedowns','nearfall3pt', 'nearfall2pt', 'stalls_opp', 'stalls'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>";
}

function print_takedown_table() {
    document.getElementById('stats_table').innerHTML = "<?php $takedown_header = array('Rank', 'Lastname', 'Firstname', 'For', 'Against','1st For', '1st Against'); print_header($takedown_header); $cat_arr = array('lastname', 'firstname', 'takedowns', 'takedowns_opp', 'firsttakedowns', 'firsttakedowns_opp'); usort($wrestler_array, 'cmp_takedowns'); print_table($cat_arr, $wrestler_array); ?>";
}

function print_top_table() {
    document.getElementById('stats_table').innerHTML = "<?php $top_header = array('Rank', 'Lastname', 'Firstname', 'Pins', '3pt Nearfalls', '2pt Nearfalls', 'Riding Times','Reversals Against', 'Escapes Against'); print_header($top_header); $cat_arr = array('lastname', 'firstname', 'pins', 'nearfall3pt', 'nearfall2pt', 'ridingtimepts', 'reversals_opp', 'escapes_opp'); usort($wrestler_array, 'cmp_top'); print_table($cat_arr, $wrestler_array); ?>";
}

function print_bottom_table() {
    document.getElementById('stats_table').innerHTML = "<?php $bottom_header = array('Rank', 'Lastname', 'Firstname', 'Reversals', 'Escapes', '3pt Nearfalls Against', '2pt Nearfalls Against', 'Riding Times Against'); print_header($bottom_header); $cat_arr = array('lastname', 'firstname', 'reversals', 'escapes', 'nearfall3pt_opp', 'nearfall2pt_opp', 'ridingtimepts_opp'); usort($wrestler_array, 'cmp_bottom'); print_table($cat_arr, $wrestler_array); ?>";
}

function print_penalties_table() {
    document.getElementById('stats_table').innerHTML = "<?php $penalties_header = array('Rank', 'Lastname', 'Firstname','Stalls For', 'Stalls Against', 'Stall Pts For', 'Stall Pts Against', 'Cautions', 'Cautions Opp', 'Caution Pts', 'Caution Pts Against'); print_header($penalties_header); $cat_arr = array('lastname', 'firstname', 'stalls_opp', 'stalls', 'stallpts', 'stallpts_opp', 'caution', 'caution_opp', 'cautionpts', 'cautionpts_opp'); usort($wrestler_array, 'cmp_penalties'); print_table($cat_arr, $wrestler_array); ?>";
}


function print_team_table() {
    document.getElementById('stats_table').innerHTML = "<?php $team_header = array('Rank', 'Lastname', 'Firstname','Pins', 'Tech Falls', '4 Pt Tech Fall', 'Majors', 'Decisions', 'Total'); print_header($team_header); $cat_arr = array('lastname', 'firstname', 'pins', 'techfall', 'techfall4pt', 'majors', 'decisions'); usort($wrestler_array, 'cmp_team'); print_table($cat_arr, $wrestler_array); ?>";
}

function print_opp_team_table() {
    document.getElementById('stats_table').innerHTML = "<?php $team_header = array('Rank', 'Lastname', 'Firstname','Pins', 'Tech Falls', '4 Pt Tech Fall', 'Majors', 'Decisions', 'Total'); print_header($team_header); $cat_arr = array('lastname', 'firstname', 'pins_opp', 'techfall_opp', 'techfall4pt_opp', 'majors_opp', 'decisions_opp'); usort($wrestler_array, 'cmp_team'); print_table($cat_arr, $wrestler_array); ?>";
}

</script>

<h1>Statistics</h1>
    <div id="statsbar">
        <a href="#" onclick="print_overall_table();">Overall</a>
        <a href="#" onclick="print_takedown_table();">Takedowns</a>
        <a href="#" onclick="print_top_table();">Top</a>
        <a href="#" onclick="print_bottom_table();">Bottom</a>
        <a href="#" onclick="print_team_table();">Team Scoring</a>
        <a href="#" onclick="print_opp_team_table();">Opponent Team Scoring</a>
        <a href="#" onclick="print_penalties_table();">Penalties</a>
    </div>

    <div id="stats_table">

        <script type="text/javascript">print_overall_table();</script>
    
    </div>


<?php endblock() ?>