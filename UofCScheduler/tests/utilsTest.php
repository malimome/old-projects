<?php

/**
 * SENG 403 Software Development in Teams and Organizations, winter 2011
 * Deliverable 1: eventTest 
 * UofC Scheduler
 * Group 2
 *
 * assert that addEvent() and deleteEvent do 
 * add/delete an event from the table customEvent.
 */

$dir = dirname(dirname(__FILE__));
require_once "$dir/application/utils.php";

class utilTest extends PHPUnit_Framework_TestCase
{
    public function testConvertHour()
    {
			$util = new TimeUtils();
			$hour= "11:30";
			$new = $util->convertHour($hour);
      $this->assertEquals($new, "1130");
			$hour= "3:30";
			$new = $util->convertHour($hour);
      $this->assertEquals($new, "330");
    }
		
		public function testextractWeekDays()
		{
			$util = new TimeUtils();
			$daysW = "MWF";
			$days = $util->extractWeekDays($daysW);
      $this->assertEquals($days[0], 1);
      $this->assertEquals($days[1], 3);
      $this->assertEquals($days[2], 5);
			$daysW = "R";
			$days = $util->extractWeekDays($daysW);
      $this->assertEquals($days[0], 4);
			$daysW = "NT";
			$days = $util->extractWeekDays($daysW);
      $this->assertEquals($days[0], 7);
      $this->assertEquals($days[1], 2);
		}

    public function testTimeDiff()
		{
			$util = new TimeUtils();
			$start = "10:09";
			$end = "10:10";
			$ret = $util->timeDiff($start, $end);
      $this->assertEquals($ret, 1);
			$start = "00:30";
			$end = "05:00";
			$ret = $util->timeDiff($start, $end);
      $this->assertEquals($ret, 4*60+30);
    }
}
?>
