<?php
	//=====PHP HEADER FOR SENG 401 PROJECT:
	//uc data
	$dbname = "mzxu";
	$dbserver = "dbs4.cpsc.ucalgary.ca";
	$dbuser = "mzxu";
	$dbpassword = "284337";
	$connect = mysql_connect($dbserver, $dbuser, $dbpassword);
	
	mysql_select_db($dbname, $connect);
	//==================================
?>
