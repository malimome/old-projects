<?php
	//localhost data
	/*
	$dbname = "ProjectMingsDB";
	$dbserver = "localhost";
	$dbuser = "root";
	$dbpassword = "";
	$connect = -1;
	*/
	
	//uc data
	$dbname = "mzxu";
	$dbserver = "dbs4.cpsc.ucalgary.ca";
	$dbuser = "mzxu";
	$dbpassword = "284337";
	$connect = -1;
	
	$connect = @mysql_connect($dbserver, $dbuser, $dbpassword) or die("cannot connect to sql server");
	
	//can be used to set up database if not already existing, more likely for localhost since cpsc servers don't give us create
	//permissions
	$createDatabase = false;
	if($createDatabase) {
		$createDBQuery = "CREATE DATABASE " . $dbname;
		mysql_query($createDBQuery, $connect) or die(mysql_error());
	}
	
	mysql_select_db($dbname, $connect) or die("cannot select db");
	
	//switch createTable to true to create all required tables
	$createTable = false;
	
	if($createTable) {			
		$sqlTbl = "CREATE TABLE courseListings(
				course_ID varchar(40),
				PRIMARY KEY(course_ID),
				course_Name varchar(40),
				instructor varchar(40),
				faculty varchar(40),
				description varchar(500),
				semester varchar(6),
				startDate varchar(10),
				endDate varchar(10),
				startTime varchar(5),
				endTime varchar(5),
				daysOfWeek varchar(3)
		)";
		mysql_query($sqlTbl, $connect) or die("cannot create table 1");	
	}

	$createTable = false;	
	if($createTable) {			
		$sqlTbl = "CREATE TABLE scheduleListings(
			schedule_ID int AUTO_INCREMENT,
			course_ID varchar(40),
			PRIMARY KEY(schedule_ID),
			FOREIGN KEY(course_ID) REFERENCES courseListings(course_ID)
		)";
		mysql_query($sqlTbl, $connect) or die("cannot create table 2");	
	}

	$createTable = false;	
	if($createTable) {			
		$sqlTbl = "CREATE TABLE userAccounts(
			clientName varchar(40),
			gender varchar(6),
			birthdate varchar(10),
			email varchar(40),
			PRIMARY KEY(email),
			password varchar(20),
			schedule_ID varchar(40),
			FOREIGN KEY(schedule_ID) REFERENCES scheduleListings(schedule_ID)
		)";
		mysql_query($sqlTbl, $connect) or die("cannot create table 3");	
	}	
	
	$createTable = false;	
	if($createTable) {			
		$sqlTbl = "CREATE TABLE customEvents(
			event_ID int AUTO_INCREMENT,
			PRIMARY KEY(event_ID),
			event_Name varchar(40),
			startTime varchar(5),
			endTime varchar(5),
			daysOfWeek varchar(10),
			weekly varchar(3)
		)";
		mysql_query($sqlTbl, $connect) or die("cannot create table 4");	
	}	
	
	if($createTable){
		echo "DB CREATED";
	}
?>
