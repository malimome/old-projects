<?php	
	//Singleton class responsible for handing interactions with the database
	class dbHandler {
		private static $instance;
		private	$dbname = "mzxu";
		private $dbserver = "dbs4.cpsc.ucalgary.ca";
		private $dbuser = "mzxu";
		private $dbpassword = "284337";
		
		public static function getInstance() 
		{
			if(self::$instance == null)
				self::$instance = new dbHandler();
			return self::$instance;
		}
		private function __construct()
		{
			$this->connect();
		}
		private function connect() 
		{
			$connect = mysql_connect($this->dbserver, $this->dbuser, $this->dbpassword);	
			mysql_select_db($this->dbname, $connect);
		}
		
		public function query($str)
		{
			$result = mysql_query($str);
			if (!$result)
			    die('Invalid query: ' . mysql_error());
			return $result;
		}
		public function delete($table, $key, $value)
		{
  			mysql_query("DELETE FROM $table WHERE $key = '$value'");
  			return 0;
		}
		public function insert($table, $valuesArray)
		{
			if($table == "customEvents")
			{
				$this->insertEvent($valuesArray);
			} else if($table == "courseListings")
			{
				$this->insertCourse($valuesArray);
			} else if($table == "scheduleListings")
			{
				$this->insertIntoSchedule($valuesArray);
			}
			return 0;
		}
		private function insertEvent($valuesArray)
		{
			$event_Name = $valuesArray["event_Name"];
			$startTime = $valuesArray["startTime"];
			$endTime = $valuesArray["endTime"];
			$days = $valuesArray["daysOfWeek"];
			$weekly = $valuesArray["weekly"];
				
			$query = "INSERT INTO customEvents (event_ID, event_Name, startTime, endTime, daysOfWeek, weekly) 
					VALUES ('AUTO_INCREMENT', '$event_Name', '$startTime', '$endTime','$days', '$weekly')";
			$result = mysql_query($query);
			if (!$result)
		  		die('Invalid query: ' . mysql_error());
		}
		private function insertCourse($valuesArray)
		{
			$course_ID = $valuesArray["course_ID"];
      $startTut  = $valuesArray["StartTimeTut"];
      $endTut  = $valuesArray["EndTimeTut"];
			$instructor = $valuesArray["instructor"];
			$faculty = $valuesArray["faculty"];
			$description = $valuesArray["description"];
			$semester = $valuesArray["semester"];
			$startDate = $valuesArray["startDate"];
			$endDate = $valuesArray["endDate"];
			$startTime = $valuesArray["startTime"];
			$endTime = $valuesArray["endTime"];
			$daysOfWeek = $valuesArray["daysOfWeek"];
			$course_Name = $valuesArray["course_Name"];
			
			$query = "INSERT INTO courseListings VALUES ('$course_ID', '$startTut', '$endTut', '$instructor', '$faculty', '$description', 
					 '$semester', '$startDate', '$endDate', '$startTime', '$endTime', '$daysOfWeek', '$course_Name')";
		   	$result = mysql_query($query);
			if (!$result)
		  		die('Invalid query: ' . mysql_error());
		}
		private function insertIntoSchedule($valuesArray)
		{
			$course_ID = $valuesArray["course_ID"];
			$result = mysql_query("INSERT INTO scheduleListings (schedule_ID, course_ID)
								VALUES ('AUTO_INCREMENT', '$course_ID')");
			if(!$result)
				die('Invalid query: ' . mysql_error());
		}
		
		//For some reason the fetch is giving an extra empty element or something when I test it as it displays
		// an empty row when I output stuff.
		public function fetch($str)
		{
			$query = mysql_query($str);
			$array = array();
			$i = 0;
			while ($res = mysql_fetch_array($query)) {
				$array[$i]= $res;
				$i++;
			}
			return $array;
		}

		public function fetchClassesInSchedule()
		{
			return $this->fetch("SELECT course_ID, startTime, endTime, StartTimeTut, EndTimeTut, instructor, daysOfWeek 
							FROM courseListings
							WHERE course_ID IN (SELECT course_ID 
									FROM scheduleListings ORDER BY course_ID)");
		}

		public function fetchEvents()
		{
			return $this->fetch("SELECT *
					FROM customEvents
					ORDER BY event_Name");
		}
	}
?>
