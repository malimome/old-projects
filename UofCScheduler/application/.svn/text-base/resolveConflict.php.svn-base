<?php
$dir = dirname(dirname(__FILE__));
require_once "$dir/application/dbHandler.php";
require_once "$dir/application/xmlHandler.php";
require_once "$dir/application/utils.php";
class resolveConflict
{
	private static $courses;
	private $coursesNum = 0;
	private $max;
	private $min;
	private static $instance;

	public static function getInstance($min, $max)
	{
		if (self::$instance == null)
		self::$instance = new resolveConflict($min, $max);
		self::$instance->min = $min;
		self::$instance->max = $max;
		return self::$instance;
	}
	private function __construct($min, $max)
	{
		$this->min = $min;
		$this->max = $max;
	}	
	
	public function getMin()
	{
		return $this->min;
	}

	public function getMax()
	{
		return $this->max;
	}

	public function getCourses()
	{
		return self::$courses;
	}

	public function setCoursesNum($c)
	{
		$this->coursesNum = $c;
	}
		
	private function checkConflictInTwoCrs($crsInd1, $crsInd2)
	{
		$util = new TimeUtils();
		$days1 = $util->extractWeekDays($crsInd1['daysOfWeek']);	
		$days2 = $util->extractWeekDays($crsInd2['daysOfWeek']);	
		$intersect = array_intersect($days1, $days2);
		if (empty($intersect))
			return false;

		$sT1 = intval($util->convertHour($crsInd1['startTime']));
		$eT1 = intval($util->convertHour($crsInd1['endTime']));
		$sT2 = intval($util->convertHour($crsInd2['startTime']));
		$eT2 = intval($util->convertHour($crsInd2['endTime']));
    
    $sTT1 = 0; $sTT2 = 0; $eTT1 = 0; $eTT2 = 0;
    if (!empty($crsInd1['StartTimeTut']))
		  $sTT1 = intval($util->convertHour($crsInd1['StartTimeTut']));
    if (!empty($crsInd1['EndTimeTut']))
		  $eTT1 = intval($util->convertHour($crsInd1['EndTimeTut']));
    if (!empty($crsInd2['StartTimeTut']))
		  $sTT2 = intval($util->convertHour($crsInd2['StartTimeTut']));
    if (!empty($crsInd2['EndTimeTut']))
		  $eTT2 = intval($util->convertHour($crsInd2['EndTimeTut']));
    if (($sT1 >= $sT2 and $sT1<$eT2) or ($sT1 >= $sTT2 and $sT1<$eTT2))
      return true;
    if (($sTT1 >= $sT2 and $sTT1<$eT2) or ($sTT1 >= $sTT2 and $sTT1<$eTT2))
      return true;
    if (($sT2 >= $sT1 and $sT2<$eT1) or ($sT2 >= $sTT1 and $sT2<$eTT1))
      return true;  
    if (($sTT2 >= $sT1 and $sTT2<$eT1) or ($sTT2 >= $sTT1 and $sTT2<$eTT1))
      return true;  
		//there are no conflicts return false
		return false;
	}
	
	public function getAllCourses($is_xml = false)
	{
		global $dir;
		//Read from database through dbHandler and put all courses in schedule into $courses
		if ($is_xml)
		{
		  $xml = new xmlHandler();
      $file1 = "$dir/uploads/xmlFile1.xml";
      $file2 = "$dir/uploads/xmlFile2.xml";
			$allcourses = $xml->parseFile1($file1);	
			if ($allcourses < 0)
				return -1;
			$settings = $xml->parseFile2($file2);	
			if ($settings < 0)
				return -1;
			$events = $settings['events'];
			$this->min = $settings['min'];
			$this->max = $settings['max'];
		}
		else
		{
			$database = dbHandler::getInstance();
	
			$allcourses = $database->fetchClassesInSchedule();
			$events  = $database->fetchEvents();
		}
		$courses = array();

		foreach ($allcourses as $crs)
		{
			foreach ($events as $ev)
			{
				if ($this->checkConflictInTwoCrs($crs, $ev))
					continue 2;
			}
			$courses[] = $crs;
		}

		self::$courses = $courses;	
		$courseCount = count(self::$courses);
		if ($this->min > $courseCount)
			$this->max = $this->min = $courseCount;
		if ($this->max < $this->min)
			$this->max = $this->min;
		if ($this->max > $courseCount)
			$this->max = $courseCount;
		return 0; //-1 if something went wrong
	}

	private function sequenceArray(&$schedule, $n)
	{
		for ($i=0; $i<$n; $i++)
			$schedule[$i]=$i;
	}

	private function resetArrayFromPos(&$schedule, $i)
	{
		$scheduleCount = count($schedule);
		$newVal = $schedule[$i];
		for ($c = $i; $c<$scheduleCount; $c++)
		{
			$newVal++;
			$schedule[$c] = $newVal;
		}
	}
	
	/*
	 * $schedule is an array of numbers between 1 to $courseCount
	 * based on the numbers in $schedule, generate the next schedule and replace it in $schedule
	 * example
	 * if $schedule was array(1,3,5) then return the next one which is array(1,3,6)
	 * if courseCount is 6 and array is (4,5,6) then the next one is (1,2,3,4)
	 */
	public function getSubsetsOfCourses(&$schedule, $num=0)
	{
		$min = $num==0 ? $this->min : $num;
		$max = $num==0 ? $this->max : $num;
		$courseCount = $this->coursesNum==0 ? count(self::$courses): $this->coursesNum;
		if ($courseCount==0)
			return false;
			
		if (empty($schedule))
		{
			$this->sequenceArray($schedule, $min);
			return true;
		}
		if (!is_array($schedule))
			return false;
		$scheduleCount = count($schedule);
		for ($i = $scheduleCount-1; $i>=0; $i--)
		{
			$maxInPos = $courseCount + $i - $scheduleCount;
			if ($schedule[$i] == $maxInPos)    //if (1,2,6) continue
			{
				continue;
			}
			else if ($schedule[$i] < $maxInPos)   //if (1,2,6) change it to (1,3,4) or from (1,2,3) to (1,2,4) 
			{
				$this->resetArrayFromPos($schedule, $i);
				return true;	
			}
		}
		// Here the array looks like (4,5,6) since it has passed prev conditions
		// Now we restart Array with length one more than $scheduleCount

		if ($scheduleCount < $max) //Go to next size for array
		{
			$this->sequenceArray($schedule, $scheduleCount +1);
			return true;
		}
		else if ($scheduleCount == $max) //Finished enumeration
		{
			return false;
		}
		return false;
	}
		
	public function getScheduleList($is_xml = false)
	{
		$crs = array();
		$this->getAllCourses($is_xml);
		$schedule= array();
		$conflicts = array();
		$j = 0;
		while ($this->getSubsetsOfCourses($schedule, 2))
		{
			if ($this->checkConflictInTwoCrs(self::$courses[$schedule[0]], self::$courses[$schedule[1]]))
				$conflicts[] = $schedule;
		}
		$schedule = array();

		while ($this->getSubsetsOfCourses($schedule))
		{
			foreach ($conflicts as $conf)
			{
				if (in_array($conf[0], $schedule) && in_array($conf[1], $schedule))
					continue 2;
			}
			$crs[] = $schedule;
		}
		return $crs;
	}
}
?>
