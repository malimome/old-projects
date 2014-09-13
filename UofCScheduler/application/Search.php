<?php
$dir = dirname(dirname(__FILE__));
require_once "$dir/application/dbHandler.php";

class Search{
	//search stuff by course name
	public function execute($course_Name, $faculty, $time){
		$instance = dbHandler::getInstance();
		//if only course name is filled use this query
		if($course_Name != "" && $faculty == "ALL" && $time == ""){
		$nameQ = "SELECT *
				FROM courseListings
				WHERE course_Name LIKE '%$course_Name%'";
		}//if course name is filled and faculty is not all, but time is empty
		else if($course_Name != "" && $faculty != "ALL" && $time == ""){
		$nameQ = "SELECT *
				FROM courseListings
				WHERE course_Name LIKE '%$course_Name%'
				AND faculty = '$faculty'";			
		}//if all three field values have been filled
		else if($course_Name != "" && $faculty != "ALL" && $time != ""){
		$nameQ = "SELECT *
				FROM courseListings
				WHERE course_Name LIKE '%$course_Name%'
				AND faculty = '$faculty' AND	startTime LIKE '%$time%'";			
		}//if only faculty was selected
		else if($course_Name == "" && $faculty != "ALL" && $time == ""){
		$nameQ = "SELECT *
				FROM courseListings
				WHERE faculty = '$faculty'";			
		}//if only faculty and time are set
		else if($course_Name == "" && $faculty != "ALL" && $time != ""){
		$nameQ = "SELECT *
				FROM courseListings
				WHERE faculty = '$faculty' AND
				startTime LIKE '%$time%'";			
		}		
		else{// all fields are empty or otherwise use default query
		$nameQ = "SELECT *
				FROM courseListings
				WHERE course_Name LIKE '%$course_Name%'";			
		}
		$array = $instance->fetch($nameQ);
		foreach($array as $row)
		{
			echo "<table><tr><th width = \"9%\">Course Name</th>
			<th width = \"9%\">Instructor</th>
			<th width = \"19%\">Description</th>
			<th width = \"9%\">Faculty</th>
			<th width = \"9%\">Semester</th>
			<th width = \"9%\">Start Time</th>
			<th width = \"9%\">End Time</th>
			<th width = \"9%\">Start Date</th>
			<th width = \"9%\">End Date</th>
			<th width = \"9%\">Days</th></tr>" . 
			"<tr>" . "<td width = \"9%\">" . $row['course_Name'] . "</td>" .
			"<td width = \"9%\">" . $row['instructor'] . "</td>" .
			"<td width = \"19%\">" . $row['description'] . "</td>" .
			"<td width = \"9%\">" . $row['faculty'] . "</td>" .
			"<td width = \"9%\">" . $row['semester'] . "</td>" .
			"<td width = \"9%\">" . $row['startTime'] . "</td>" .
			"<td width = \"9%\">" . $row['endTime'] . "</td>" .
			"<td width = \"9%\">" . $row['startDate'] . "</td>" .
			"<td width = \"9%\">" . $row['endDate'] . "</td>" .
			"<td width = \"9%\">" . $row['daysOfWeek'] . "</td>" .
			"</tr></table>";
		}
	}
	

}
?>
