<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class = "body">
	<div class = "header">
		<img src = "../img/banner.png"/>
	</div>
	
	<?php include 'navi.php' ?>
	
	<div class = "content">
	<h1>Search</h1>
	<p>
	Here you can search through the course listings.

	<form action = "searchResults.php" method = "post">
	<table>
	<tr><td width = "30%">Course Name: </td><td><input type = "text" name = "cName" /></td></tr>
	<tr><td width = "30%">Faculty: </td><td>
	<select NAME = "cFaculty">
	<option VALUE = "ALL">--</option>
	<option VALUE = "ENGG">Engineering</option>
	<option VALUE = "SENG">Software Engineering</option>
	<option VALUE = "CPSC">Computer Science</option>
	</select>
	</td></tr>
	<tr><td width = "30%">Time block: </td><td><input type = "text" name = "cTimeBlock" /></td></tr>
	<input type = "hidden" name = "searching" value = "yes" />
	<tr><td width = "30%"></td><td><input type = "submit" value = "Search" /></td></tr>
	</table>
	</form>
	<br></br>
	</p>
	</div>
	</div>
</body>
</html>
