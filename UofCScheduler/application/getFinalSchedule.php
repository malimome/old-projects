<?php

$dir = dirname(dirname(__FILE__));
require "$dir/application/schedule.inc.php";
require_once "$dir/application/dbHandler.php";
require_once "$dir/application/resolveConflict.php";
require_once "$dir/application/utils.php";

function generate_schedule($courses, $is_xml = false)
{
//result limits incase we need them in the future
$scheduleLIMIT = 20;
$numResults = 0;

$classes_arr = array(
	// Classes for monday (day 1)
	1 => array(
	),
	
	2 => array(
	),
	
	3 => array(
	),
	
	4 => array(
	),
	
	5 => array(
	),
	
	6 => array(
	)
);

//$eventQ = "SELECT *
//			FROM customEvents
//			ORDER BY event_Name";

$util = new TimeUtils();
if (!$is_xml)
{
	$instance = dbHandler::getInstance();
	$arrayEvent = $instance->fetchEvents();
	foreach($arrayEvent as $row)
	{
			$days = $util->extractWeekDays($row['daysOfWeek']);
			for ($i=0; $i<count($days); $i++)
			{
				$startAt = $util->convertHour($row['startTime']);
				$classes_arr[$days[$i]][$startAt] = array();
				$classes_arr[$days[$i]][$startAt]["html"] = "<b>" . $row['event_Name'] . "</b><br>" . $row['event_ID'];		
				$classes_arr[$days[$i]][$startAt]["interval"] = $util->timeDiff($row['startTime'], $row['endTime']);		
//				$eventID[$numResults] = $row['event_ID'];
			}
			$numResults++; 
	}
}

$numResults = 0; 
$rc = resolveConflict::getInstance(1, 1);
$rc->getAllCourses($is_xml);
$courseList = $rc->getCourses();
foreach($courses as $crs)
{
			$row = $courseList[intval($crs)];
			$days = $util->extractWeekDays($row['daysOfWeek']);
			for ($i=0; $i<count($days); $i++)
			{
				$startAt = $util->convertHour($row['startTime']);
				$classes_arr[$days[$i]][$startAt] = array();
				$classes_arr[$days[$i]][$startAt]["html"] = "<b>" . $row['course_ID'] . "</b><br>" . $row['instructor'];		
				$classes_arr[$days[$i]][$startAt]["interval"] = $util->timeDiff($row['startTime'], $row['endTime']) + 10;		

        if ($row['StartTimeTut'] != "00:00")
        {
				  $startAt = $util->convertHour($row['StartTimeTut']);
				  $classes_arr[$days[$i]][$startAt] = array();
				  $classes_arr[$days[$i]][$startAt]["html"] = "<b>" . $row['course_ID'] . "</b><br> Tutorial";		
				  $classes_arr[$days[$i]][$startAt]["interval"] = $util->timeDiff($row['StartTimeTut'], $row['EndTimeTut']) + 10;		
        }
			}
			$numResults++; 
}
//print_r($classes_arr);
/*
	This is the schedule options array. See schedule.inc.php
	for more details.
*/
$options = array( 
			"row_interval" => 30, // set the schedule to display a row for every /2hr
			"start_time" => 700, // schedule start time  (8am)
			"end_time" => 2200,   // schedule end time (10pm)
			"title" => "<font color=\"#FFFFFF\">Class Schedule for Name</font>",
			"title_style" => "font-family: verdana; font-size: 14pt;", // css style for schedule title
			"time_style" => "font-family: verdana; font-size: 8pt;",  // css style for the time cells
			"dayheader_style" => "font-family: verdana; font-size: 10pt;", // css style for the day header cells
			
			// default css style for the class cells. Eachs tyle can be overridden using the "style" property of each class
			// see schedule.inc.php for details.
			"class_globalstyle" => "background-color: #7d98b3; font-family: verdana; font-size: 8pt; text-align: center;", 
		);
return schedule_generate($classes_arr, $options);
}

function getScheduleCourses($courses, $is_xml)
{
  $rc = resolveConflict::getInstance(1, 1);
  $rc->getAllCourses($is_xml);
  $courseList = $rc->getCourses();
  foreach($courses as $crs)
  {
    $row[] = $courseList[intval($crs)];
  }
  return $row;
}

?>
