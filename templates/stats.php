<?php include "header.php" ?>
<?php 
    require_once "print.php";
?>




<div id="tables">
<script type="text/javascript">
function print_overall_table() {
    document.getElementById('stats_table').innerHTML = "<?php $match_header = array('Rank', 'Lastname', 'Firstname', 'Wins', 'Losses', 'Pins', 'Takedowns', '3pt Nearfalls', '2pt Nearfalls', 'Stalls For','Stalls Against'); print_header($match_header, 'Overall Leaders'); $cat_arr = array('lastname', 'firstname', 'wins', 'losses', 'pins', 'takedowns','nearfall3pt', 'nearfall2pt', 'stalls_opp', 'stalls'); usort($wrestler_array, 'rank'); print_table($cat_arr, $wrestler_array); ?>";
    sorttable.reinit();
}

function print_takedown_table() {
    document.getElementById('stats_table').innerHTML = "<?php $takedown_header = array('Rank', 'Lastname', 'Firstname', 'For', 'Against','1st For', '1st Against'); print_header($takedown_header, 'Takedown Leaders'); $cat_arr = array('lastname', 'firstname', 'takedowns', 'takedowns_opp', 'firsttakedowns', 'firsttakedowns_opp'); usort($wrestler_array, 'cmp_takedowns'); print_table($cat_arr, $wrestler_array); ?>";
    sorttable.reinit();
}

function print_top_table() {
    document.getElementById('stats_table').innerHTML = "<?php $top_header = array('Rank', 'Lastname', 'Firstname', 'Pins', '3pt Nearfalls', '2pt Nearfalls', 'Riding Times','Reversals Against', 'Escapes Against'); print_header($top_header, 'Top Leaders'); $cat_arr = array('lastname', 'firstname', 'pins', 'nearfall3pt', 'nearfall2pt', 'ridingtimepts', 'reversals_opp', 'escapes_opp'); usort($wrestler_array, 'cmp_top'); print_table($cat_arr, $wrestler_array); ?>";
    sorttable.reinit();
}

function print_bottom_table() {
    document.getElementById('stats_table').innerHTML = "<?php $bottom_header = array('Rank', 'Lastname', 'Firstname', 'Reversals', 'Escapes', '3pt Nearfalls Against', '2pt Nearfalls Against', 'Riding Times Against'); print_header($bottom_header, 'Bottom Leaders'); $cat_arr = array('lastname', 'firstname', 'reversals', 'escapes', 'nearfall3pt_opp', 'nearfall2pt_opp', 'ridingtimepts_opp'); usort($wrestler_array, 'cmp_bottom'); print_table($cat_arr, $wrestler_array); ?>";
    sorttable.reinit();
}

function print_penalties_table() {
    document.getElementById('stats_table').innerHTML = "<?php $penalties_header = array('Rank', 'Lastname', 'Firstname', 'Stall Pts For', 'Stall Pts Against', 'Stalls For', 'Stalls Against', 'Caution Pts', 'Caution Pts Against', 'Cautions', 'Cautions Opp'); print_header($penalties_header, 'Penalties Leaders'); $cat_arr = array('lastname', 'firstname', 'stallpts', 'stallpts_opp',  'stalls_opp', 'stalls','cautionpts', 'cautionpts_opp','caution', 'caution_opp'); usort($wrestler_array, 'cmp_penalties'); print_table($cat_arr, $wrestler_array); ?>";
        sorttable.reinit();
}


function print_team_table() {
    document.getElementById('stats_table').innerHTML = "<?php $team_header = array('Rank', 'Lastname', 'Firstname','Pins', 'Tech Falls', '4 Pt Tech Fall', 'Majors', 'Decisions', 'Total'); print_header($team_header, 'Most Team Points'); $cat_arr = array('lastname', 'firstname', 'pins', 'techfall', 'techfall4pt', 'majors', 'decisions', 'get_teampts'); usort($wrestler_array, 'cmp_team'); print_table($cat_arr, $wrestler_array); ?>";
        sorttable.reinit();
}

function print_opp_team_table() {
    document.getElementById('stats_table').innerHTML = "<?php $team_header = array('Rank', 'Lastname', 'Firstname','Pins', 'Tech Falls', '4 Pt Tech Fall', 'Majors', 'Decisions', 'Total'); print_header($team_header, 'Least Team Points Allowed'); $cat_arr = array('lastname', 'firstname', 'pins_opp', 'techfall_opp', 'techfall4pt_opp', 'majors_opp', 'decisions_opp', 'get_teampts_opp'); usort($wrestler_array, 'cmp_team_opp'); print_table($cat_arr, $wrestler_array); ?>";
        sorttable.reinit();
}

</script>

    <div id="statsbar">
    <ul>
        <li><a href="#" onclick="print_overall_table();">Overall</a></li>
        <li><a href="#" onclick="print_takedown_table();">Takedowns</a></li>
        <li><a href="#" onclick="print_top_table();">Top</a></li>
        <li><a href="#" onclick="print_bottom_table();">Bottom</a></li>
        <li><a href="#" onclick="print_team_table();">Team Scoring</a></li>
        <li><a href="#" onclick="print_opp_team_table();">Opponent Team Scoring</a></li>
        <li><a href="#" onclick="print_penalties_table();">Penalties</a></li>
    </ul>
    </div>

    <div id="stats_table">

    <script type="text/javascript">
        print_overall_table();
        sorttable.reinit();
    </script>
    
    </div>
</div>

<?php include "footer.php" ?>
