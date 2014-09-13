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
		$action = $_POST['action'];
		$dir = dirname(dirname(__FILE__));
		include "$dir/application/getSchedule.php";

		if ($action == 'DEFS')
		{
			$eventid = $_POST['eventID'];
			require_once("$dir/application/Event.php");
			$event = new Event();
			if ($event->deleteEvent($eventid) == 0)
				echo "You have successfully deleted the event: $eventid.";
		}
		elseif ($action == 'DCFS')
		{
			$courseid = $_POST['course'];
			require_once("$dir/application/Course.php");
			$course = new Course();
			if ($course->deleteCourseFromSchedule($courseid) == 0)
				echo "You have successfully deleted the course: $courseid.";
		}
		$eventsCourses = "";
		$courseNum = writeEventCourse($eventsCourses);
	?>

	<h1>Schedule</h1>
		
	 To generate your schedule, input the minimum and maximum number of courses in your 
final schedule. Then click on "Generate Schedule List" to generate a list of possible schedules with no conflict.

	<form action = "listSchedules.php" method = "post">
	<table> <caption> Number of Courses in Schedule</caption>
	<tr><td> Min: </td> <td>
		<select NAME = "min">
		<?php
		function printOptions($num)
		{
			for ($i=1; $i<=$num; $i++)
				echo "<option VALUE = \"$i\">$i</option>";
		}
		printOptions($courseNum);
		?>
		</select>
	</td><td>Max: </td><td>
		<select NAME = "max">
		<?php printOptions($courseNum); ?>
		</select>
	</td>
	<td><input type = "submit" value = "Generate Schedule List" /></td> </tr>
	</table>
	</form>
	</p>

	This is the list of all courses to generate your schedule.
<?php 
		echo $eventsCourses; 
?>

	<form action = "listSchedules.php" method = "post">
	<table> <caption> Number of Courses in Schedule</caption>
	<tr><td> Min: </td> <td>
		<select NAME = "min">
		<?php printOptions($courseNum); ?>
		</select>
	</td><td>Max: </td><td>
		<select NAME = "max">
		<?php printOptions($courseNum); ?>
		</select>
	</td>
	<td><input type = "submit" value = "Generate Schedule List" /></td> </tr>
	</table>
	</form>
	</p>

	</p>

	<br></br>
	</div>
	</div>
</body>
</html>
