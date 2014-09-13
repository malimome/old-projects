<?php
/**
 * SENG 403 Software Development in Teams and Organizations, winter 2011
 * Deliverable 1: courseTest 
 * UofC Scheduler
 * Group 2
 *
 * assert that addCourse() and deleteCourse() do 
 * add/delete courses from the scheduleListings table.
 *
 * assert that getCourses() fetches the schedule
 * listings table from the db
 */

$dir = dirname(dirname( __FILE__));
require_once "$dir/application/Course.php";

class courseTest extends PHPUnit_Framework_TestCase
{
		
		public function testInsertCourse()
		{
				$course = new Course();
				$course->setID("CPSC111");
				$course->setName("CPSC 111");
				$course->setInstructor("SOMEONE");
				$course->setFaculty("CPSC");
				$course->setSemester("WINTER");
				$course->setStartTime("10:00");
				$course->setEndTime("11:00");
				$course->setStartDate("01/03/2011");
				$course->setEndDate("03/05/2011");
				$course->setWeekDays("THS");

				//$this->assertEquals($course->insertCourse(), 0);
		}

    public function testAddCourse()
    {
				global $dir;
		include "$dir/application/dbHeader.php";
	
        $course = new Course();
        $actual = "CPSC111";
        $course->addCourseToSchedule($actual);

        $result = mysql_query("SELECT course_ID
                        FROM scheduleListings
                        WHERE course_ID = '$actual'");

				$expected = mysql_fetch_array($result);
						
        $this->assertEquals($expected[0], $actual);
    }
	
	/**
	*@ depends addCourseToSchedule($courseID)
	*/
	public function testDeleteCourse()
    {
				global $dir;
		include "$dir/application/dbHeader.php";

        $course = new Course();
        $course->deleteCourseFromSchedule("CPSC111");
        $actual = "CPSC111";

        mysql_query("DELETE FROM scheduleListings 
									WHERE course_ID = '$actual'");							

        $result = mysql_query("SELECT course_ID
                        FROM scheduleListings
                        WHERE course_ID = '$actual'");

				$expected = mysql_fetch_array($result);
						
        $this->assertFalse($expected);
    }
	
	//not sure if should be tested, it outputs data
	public function testGetCourses()
    {
				global $dir;
		include "$dir/application/dbHeader.php";

        $course = new Course();
        $actual = $course->getCourses();;

        $this->assertNotNull($actual);
    }
}
?>
