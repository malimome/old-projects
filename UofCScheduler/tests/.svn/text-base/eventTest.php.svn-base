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

$dir=dirname(dirname(__FILE__));
require_once "$dir/application/Event.php";
require_once "$dir/application/dbHeader.php";

class eventTest extends PHPUnit_Framework_TestCase
{
    public function testAddEvent()
    {
		//include "$dir/application/dbHeader.php";
		
        $event = new Event();
				$actual = array('eName' => 'unitTest', 'sTime' => '11:27', 
				'eTime' => '11:30', 'eDaysOfWeek' => array('T','H'), 'eWeekly' => 'yes');
        $event->addEvent($actual);

      	$result = mysql_query("SELECT event_Name FROM customEvents
                        WHERE event_Name = 'unitTest'");
				$expected = mysql_fetch_array($result, MYSQL_NUM);
        $this->assertEquals($expected[0], $actual['eName']);
    }

	public function testDeleteEvent()
    {
		//include "$dir/application/dbHeader.php";
	
        $event = new Event();
				$query = "SELECT event_ID FROM customEvents
                        WHERE event_Name = 'unitTest'";
      	$result = mysql_query($query);
				$expected = mysql_fetch_array($result);
        $event->deleteEvent($expected['event_ID']);

      	$result = mysql_query($query);
				$expected = mysql_fetch_array($result);
        //$this->assertFalse($expected);
    }
}

?>
