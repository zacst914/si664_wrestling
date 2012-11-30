<?php 
    session_start();
    if ( !isset($_SESSION['username']) ) {
        header( "Location: not_authorized.php"); 
        return;
    }
    ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/style.css">
    <script src="static/sorttable.js"></script>
    <script type="text/javascript" src="static/jquery.min.js"></script>
    <meta http-equiv="content-type" content="text/html">
    <title>MWrestling</title>
    <meta name="description" content="University of Michigan's ">
    <meta name="keyword" content="wrestling, University of Michigan, wolverines">
</head>
<body>
    <div id="wrapper">
		<div id="header">
			<div id="banner">
				<a href="/mwrestling/">
				<img src="/mwrestling/images/banner.png" title="MWrestling" height="120px" style="-webkit-border-bottom-left-radius: 6px; -khtml-border-radius-bottomleft: 6px; -moz-border-radius-bottomleft: 6px; border-bottom-left-radius: 6px;" />
				</a>
			</div>
			<div id="nav">
				<span style="margin-right: 15px;">
					<a href="/mwrestling/announcements.php">
					announcements
					</a>
					|
					<a href="/mwrestling/stats.php">
					leaderboards
					</a>
					|
					<a href="/mwrestling/myaccount.php">
					my account
					</a>
					|
					<a href="/mwrestling/logout.php">
					log out
					</a>
				</span>
			</div>
		</div>
		

	