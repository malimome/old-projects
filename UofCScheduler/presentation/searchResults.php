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
	<?php
	
	$search_by_course = $_POST['cName'];
	$search_by_faculty = $_POST['cFaculty'];
	$search_by_time = $_POST['cTimeBlock'];
	
	$dir = dirname(dirname(__FILE__));
	if(file_exists("$dir/application/Search.php")){
		require_once "$dir/application/Search.php";
	}
	
	$search = new Search();
	
	echo "<a href = \"search.php\">Back to search</a><br></br>Your search results for: " . $search_by_course;

	$search->execute($search_by_course, $search_by_faculty, $search_by_time);
	?>
	<br></br>
	</p>
	</div>
	</div>
</body>
</html>
