<?php
/**
 * SENG 403 Software Development in Teams and Organizations, winter 2011
 * Deliverable 1: dbHandlerTest 
 * UofC Scheduler
 * Group 2
 */

$dir = dirname(dirname( __FILE__));
require_once "$dir/application/dbHandler.php";

class dbHandlerTest extends PHPUnit_Framework_TestCase {
	
	//Should insert event into database
	public $course_id = "ENGG210";
	
	public function testInsertToDBEvent()
	{
		$instance = dbHandler::getInstance();
		$values = array("event_Name" => "test5", "startTime" => "13:00", "endTime" => "14:00", "daysOfWeek" => "M", "weekly" => "yes");
		$expected = array("event_Name" => "", "startTime" => "", "endTime" => "", "daysOfWeek" => "", "weekly" => "");
		$instance->insert("customEvents", $values);
		
		$query = mysql_fetch_array(mysql_query("SELECT event_Name, startTime, endTime, daysOfWeek, weekly
                      							   FROM customEvents
                      							   WHERE event_Name = 'test5'"));
		$counter = 0;
		foreach($query as $row)
		{
			if($counter % 2 == 0)
				$item[$counter] = $row;
			$counter++;
		}
		
		$expected['event_Name'] = $item[0];
		$expected['startTime'] = $item[2];
		$expected['endTime'] = $item[4];
		$expected['daysOfWeek'] = $item[6];
		$expected['weekly'] = $item[8];
				
        $this->assertEquals($expected, $values);
	}
	
	//Should delete above event from database
	public function testDeleteFromDB()
	{
		$instance = dbHandler::getInstance();
		$instance->delete("customEvents", "event_Name", "test5");
		$query = mysql_fetch_array(mysql_query("SELECT event_Name, startTime, endTime, daysOfWeek, weekly
                      							   FROM customEvents
                      							   WHERE event_Name = 'test5'"));
		$this->assertFalse($query);
	}
	
	//Should insert course into database
	public function testInsertToDBCourse()
	{
		$instance = dbHandler::getInstance();
		$values = array("course_ID" => $this->course_id, "StartTimeTut" => "00:00", "EndTimeTut" => "00:00", "instructor" => "Rami", "faculty" => "ENGG", 
				"description" => "this is a test", "semester" => "WINTER", "startDate" => "01/13/2011", 
				"endDate" => "04/31/2011", "startTime" => "12:00",
				"endTime" => "13:15", "daysOfWeek" => "TR", "course_Name" => "ENGG 205");
		$expected = array("course_ID" => "", "StartTimeTut" => "", "EndTimeTut" => "", "instructor" => "", "faculty" => "", 
				"description" => "", "semester" => "", "startDate" => "", 
				"endDate" => "", "startTime" => "",
				"endTime" => "", "daysOfWeek" => "", "course_Name" => "");
		$instance->insert("courseListings", $values);
		
		$query = mysql_fetch_array(mysql_query("SELECT *
                      							   FROM courseListings
                      							   WHERE course_ID = 'ENGG210'" ));
		$counter = 0;
		foreach($query as $row)
		{
			if($counter % 2 == 0)
				$item[$counter] = $row;
			$counter++;
		}
		
		$expected['course_ID'] = $item[0];
		$expected['StartTimeTut'] = $item[2];
		$expected['EndTimeTut'] = $item[4];
		$expected['instructor'] = $item[6];
		$expected['faculty'] = $item[8];
		$expected['description'] = $item[10];
		$expected['semester'] = $item[12];
		$expected['startDate'] = $item[14];
		$expected['endDate'] = $item[16];
		$expected['startTime'] = $item[18];
		$expected['endTime'] = $item[20];
		$expected['daysOfWeek'] = $item[22];
		$expected['course_Name'] = $item[24];
				
        $this->assertEquals($expected, $values);
	}
	
	//Should insert course into a schedule
	public function testInsertToDBCourseSchedule()
	{
		$instance = dbHandler::getInstance();
		$values = array("course_ID" => $this->course_id);
		$expected = array("course_ID" => $this->course_id);
		$instance->insert("scheduleListings", $values);
		
		$query = mysql_fetch_array(mysql_query("SELECT *
                      							   FROM scheduleListings
                      							   WHERE course_ID = 'ENGG210'"));
        $this->assertEquals($expected, $values);
	}
	
	public function testDelFromDBCourseSchedule()
	{
		$instance = dbHandler::getInstance();
		$instance->delete("scheduleListings", "course_ID", $this->course_id);
		$query = mysql_fetch_array(mysql_query("SELECT *
                      							   FROM scheduleListings
                      							   WHERE course_ID = 'ENGG210'"));
		$this->assertFalse($query);
  		//Exception Handling
  		return 0;
	}
	
	//Should delete course from database
	public function testDeleteFromDBCourse()
	{
		$instance = dbHandler::getInstance();
		$instance->delete("courseListings", "course_ID", $this->course_id);
		$query = mysql_fetch_array(mysql_query("SELECT *
                      							   FROM courseListings
                      							   WHERE course_ID = 'ENGG210'"));
		$this->assertFalse($query);
	}
	
	//Should fetch array of all courses
	public function testFetchCourses()
	{		
		//insert what i will see is fetched!!!
		$instance = dbHandler::getInstance();
		$nameQ = "SELECT * 
				FROM courseListings
				ORDER BY course_ID";
		$array = $instance->fetch($nameQ);
		foreach($array as $row)
		{
			//print_r($row);
		}
		$this->assertFalse(FALSE); //temp
	}
	
	//Should fetch array of all events
	public function testFetchEvents()
	{
		$instance = dbHandler::getInstance();
		$eventQ = "SELECT *
				FROM customEvents
				ORDER BY event_Name";
		$array = $instance->fetch($eventQ);
		foreach ($array as $row)
		{
			//print_r($row);
		}
		$this->assertFalse(FALSE); //temp
	}
	
	//Should fetch array of courses in the schedule
	public function testFetchScheduleCourses()
	{
		$instance = dbHandler::getInstance();
		$scheduleQ = "SELECT * 
				FROM (courseListings AS c)
				WHERE c.course_ID IN (SELECT course_ID
									FROM scheduleListings)";
		$array = $instance->fetch($scheduleQ);
		foreach($array as $row)
		{
			//print_r($row);
		}
		$this->assertFalse(FALSE); //temp
	}
}
?>
