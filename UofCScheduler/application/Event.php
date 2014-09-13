<?php

/*
 * Class responsible for all event activities such as Adding, deleting and ... events
 */
$dir = dirname(dirname( __FILE__));
require_once "$dir/application/dbHandler.php";
class Event
{
	private $eventName;
	private $startTime;
	private $endTime;
	private $daysOfWeek;

	//Adds an event to the schedule	
	public function addEvent($_POST)
	{
		global $dir;
		$eventName = $_POST['eName'];
		$startTime = $_POST['sTime'];
		$endTime = $_POST['eTime'];
		$daysOfWeek_array = $_POST['eDaysOfWeek'];
		$daysOfWeek = "";
		foreach($daysOfWeek_array as $i)
		{
			$daysOfWeek .= $i;
		}
		//if(fetch(query) != toInsert(query)) {		COULD THIS LOGIC FIX DUPLICATE ADDS?
		$values = array("event_Name" => $eventName, "startTime" => $startTime, "endTime" => $endTime, "daysOfWeek" => $daysOfWeek, "weekly" => "yes");
		$instance = dbHandler::getInstance();
		$instance->insert("customEvents", $values);
				
		return 0;
	}

	//Delete an event from the schedule
	public function deleteEvent($eventID)
	{
		$instance = dbHandler::getInstance();
		$instance->delete("customEvents", "event_ID", $eventID);
		return 0;
	}

}

?>

