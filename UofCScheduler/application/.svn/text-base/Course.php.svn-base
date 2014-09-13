<?php
/*
 * Class responsible for all class activities such as Adding, deleting and ... courses
 */
$dir = dirname(dirname( __FILE__));
require_once "$dir/application/dbHandler.php";
class Course 
{  
	var $ID;
	var $startTimeTut;
	var $endTimeTut;
	var $name;
	var $instructor;
	var $faculty;
	var $description;
	var $semester;
	var $startTime;
	var $endTime;
	var $startDate;
	var $endDate;
	var $weekDays;


	//Insert a new course into the database
  public function insertCourse()
  {
  	$instance = dbHandler::getInstance();
	$values = array("course_ID" => $this->ID, "instructor" => $this->instructor, "faculty" => $this->faculty, 
				"description" => $this->description, "semester" => $this->semester, "startDate" => $this->startDate, 
				"endDate" => $this->endDate, "startTime" => $this->startTime,
				"endTime" => $this->endTime, "daysOfWeek" => $this->weekDays, "course_Name" => $this->name);	
	$instance->insert("courseListings", $values);	
  	return 0;
  }

	//Add a course to the schedule
  public function addCourseToSchedule($courseID)
  {  	
 	$instance = dbHandler::getInstance();
	$values = array("course_ID" => $courseID);
	$instance->insert("scheduleListings", $values);
  	//Exception Handling
  	return 0;
  }

	//Delete a course from the schedule
  public function deleteCourseFromSchedule($courseID)
  {
  	$instance = dbHandler::getInstance();
	$instance->delete("scheduleListings", "course_ID", $courseID);
  	return 0;
  }

	//Get all courses
  public function getCourses() 
  {
  	$instance = dbHandler::getInstance();
	$nameQ = "SELECT * 
			FROM courseListings
			ORDER BY course_ID";
	$array = $instance->fetch($nameQ);
		$out = "<table class=schedule><caption><b> Press + to add the course to schedule</b>/caption>
				<tr><th width = \"8%\"><i>Course Name</i></th>
				<th width = \"8%\"><i>Instructor</i></th>
				<th width = \"17%\"><i>Description</i></th>
				<th width = \"8%\"><i>Faculty</i></th>
				<th width = \"8%\"><i>Semester</i></th>
				<th width = \"7%\"><i>Start Time</i></th>
				<th width = \"7%\"><i>End Time</i></th>
				<th width = \"7%\"><i>Tutorial Start Time</i></th>
				<th width = \"7%\"><i>Tutorial End Time</i></th>
				<th width = \"8%\"><i>Start Date</i></th>
				<th width = \"8%\"><i>End Date</i></th>
				<th width = \"8%\"><i>Days</i></th>
				<th width = \"8%\"></th></tr>";

	foreach($array as $row)
	{
				$course = $row['course_ID'];
		$out .= "<tr>" . "<td width = \"8%\">" . $row['course_Name'] . "</td>" .
				"<td width = \"8%\">" . $row['instructor'] . "</td>" .
				"<td width = \"17%\">" . $row['description'] . "</td>" .
				"<td width = \"8%\">" . $row['faculty'] . "</td>" .
				"<td width = \"8%\">" . $row['semester'] . "</td>" .
				"<td width = \"7%\">" . $row['startTime'] . "</td>" .
				"<td width = \"7%\">" . $row['endTime'] . "</td>" .
				"<td width = \"7%\">" . $row['StartTimeTut'] . "</td>" .
				"<td width = \"7%\">" . $row['EndTimeTut'] . "</td>" .		
				"<td width = \"8%\">" . $row['startDate'] . "</td>" .
				"<td width = \"8%\">" . $row['endDate'] . "</td>" .
				"<td width = \"8%\">" . $row['daysOfWeek'] . "</td>" .
				"<td width = \"8%\">" . 
				"<form action = \"courseListings.php\", method = \"post\">
				<input type = \"hidden\" name = \"course\" value = $course />
				<input type = \"hidden\" name = \"action\" value = ACTS />
				<input type = \"submit\" value = \"+\" />
				</form></td>";
	}
	$out .= "</table>";
	return $out;
  }

	public function setID($id)
	{
			$this->ID = $id;
			return 0;
	}
	public function setName($name)
	{
			$this->name = $name;
			return 0;
	}
	public function setInstructor($instructor)
	{
			$this->instructor = $instructor;
			return 0;
	}
	public function setFaculty($faculty)
	{
			$this->faculty= $faculty;
			return 0;
	}
	public function setSemester($semster)
	{
			$this->semester= $semster;
			return 0;
	}
	public function setDescription($description)
	{
			$this->description= $description;
			return 0;
	}
	public function setStartTime($startTime)
	{
			$this->startTime= $startTime;
			return 0;
	}
	public function setEndTime($endTime)
	{
			$this->endTime= $endTime;
			return 0;
	}
	public function setStartDate($startDate)
	{
			$this->startDate= $startDate;
			return 0;
	}
	public function setEndDate($endDate)
	{
			$this->endDate= $endDate;
			return 0;
	}
	public function setWeekDays($weekDays)
	{
			$this->weekDays= $weekDays;
			return 0;
	}

}

?>
