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
	<?php 
		$dir = dirname(dirname(__FILE__));
	  if (file_exists("$dir/application/Course.php"))
		{
   		  require_once("$dir/application/Course.php");
		}
		$action = $_POST['action'];
		$course = new Course();
		if ($action == "ACTS")
		{
			$courseID = $_POST['course'];
			if ($course->addCourseToSchedule($courseID) == 0)
				echo "You have successfully added the course $courseID to the schedule";
		}
		echo "<h1>Courses currently offered this semester</h1>";
	  echo $course->getCourses();	
	?>
	</div>
	</div>
</body>
</html>
