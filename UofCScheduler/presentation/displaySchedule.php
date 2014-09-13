
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
	<h1>Schedule</h1>
	
<?php
$dir = dirname(dirname(__FILE__));
require "$dir/application/getFinalSchedule.php";
$courses = $_POST['courses'];
$is_xml = ($_POST['action']==xml ? true : false);
echo generate_schedule($courses, $is_xml);
?>
