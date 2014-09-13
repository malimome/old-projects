<?php
$dir = dirname(dirname(__FILE__));
require_once "$dir/application/dbHandler.php";

function writeEventCourse(&$output)
{	
$output = "";
$scheduleQ = "SELECT * 
			FROM (courseListings AS c)
			WHERE c.course_ID IN (SELECT course_ID
									FROM scheduleListings)";

$eventQ = "SELECT *
			FROM customEvents
			ORDER BY event_Name";

//result limits incase we need them in the future
$scheduleLIMIT = 20;
$numResults = 0;

$instance = dbHandler::getInstance();
$arraySchedule = $instance->fetch($scheduleQ);
$output = "Click on button \"-\" to delete the course from schedule.";
$output .= "<table class=schedule><tr><th width = \"9%\"><i>Course Name</i></th>
				<th width = \"9%\"><i>Instructor</i></th>
				<th width = \"19%\"><i>Description</i></th>
				<th width = \"9%\"><i>Faculty</i></th>
				<th width = \"9%\"><i>Semester</i></th>
				<th width = \"9%\"><i>Start Time</i></th>
				<th width = \"9%\"><i>End Time</i></th>
				<th width = \"9%\"><i>Start Date</i></th>
				<th width = \"9%\"><i>End Date</i></th>
				<th width = \"9%\"><i>Days</i></th>
				<th width = \"9%\"></th></tr>";

foreach($arraySchedule as $row)
{
	$output .= "<tr>" . "<td width = \"9%\">" . $row['course_Name'] . "</td>" .
			"<td width = \"9%\">" . $row['instructor'] . "</td>" .
			"<td width = \"19%\">" . $row['description'] . "</td>" .
			"<td width = \"9%\">" . $row['faculty'] . "</td>" .
			"<td width = \"9%\">" . $row['semester'] . "</td>" .
			"<td width = \"9%\">" . $row['startTime'] . "</td>" .
			"<td width = \"9%\">" . $row['endTime'] . "</td>" .
			"<td width = \"9%\">" . $row['startDate'] . "</td>" .
			"<td width = \"9%\">" . $row['endDate'] . "</td>" .
			"<td width = \"9%\">" . $row['daysOfWeek'] . "</td>" .
			"<td width = \"9%\">" . 
			"<div class = \"button\">
			<form action = \"schedule.php\", method = \"post\">
			<input type = \"hidden\" name = \"course\" value = " . $row['course_ID'] . " />
			<input type = \"hidden\" name = \"action\" value = \"DCFS\" />
			<input type = \"submit\" value = \"-\" />
			</form></div>". "</td>";
	
			$numResults++; 
}
$output .= "</tr></table><br></br>";

$arrayEvent = $instance->fetch($eventQ);
$output .= "<table class=schedule>
			<tr>
			<th width = \"20%\"><i>Event Name</i></th>
			<th width = \"20%\"><i>Start Time</i></th>
			<th width = \"20%\"><i>End Time</i></th>
			<th width = \"20%\"><i>Week Days</i></th>
			<th width = \"20%\"><i>Weekly Re-occuring</i>/th> 
			<th width = \"20%\"> </th>";

foreach($arrayEvent as $row)
{
	$output .= "<tr>" . "<td width = \"20%\">" . $row['event_Name'] . "</td>" .
			"<td width = \"20%\">" . $row['startTime'] . "</td>" .
			"<td width = \"20%\">" . $row['endTime'] . "</td>" .
			"<td width = \"20%\">" . $row['daysOfWeek'] . "</td>" .
			"<td width = \"20%\">" . $row['weekly'] . "</td>" .
			"<td width = \"20%\">" . 
			"<div class = \"button\">
			<form action = \"schedule.php\", method = \"post\">
			<input type = \"hidden\" name = \"eventID\" value = " . $row['event_ID'] . " />
			<input type = \"hidden\" name = \"action\" value = \"DEFS\" />
			<input type = \"submit\" value = \"-\" />
			</form></div>"	. "</td>";
}
$output .= "</tr></table><br></br>";

return $numResults;
}
?>
