<?php
//class responsible for handing interactions with the xml file
class xmlHandler 
{
	//file1 contaisn DB with all courses
	public function parseFile1($file)  
	{
		$courses = array();
		
		if (file_exists($file))
		{
			$xml = @simplexml_load_file($file);
			if($xml ===  FALSE) 
			   return -1;
		}
		else 
		    return -2;
		
		foreach($xml->class as $course)
		{		
      if (!empty($course-> StartTimeTut))
        $stt = (string)$course-> StartTimeTut;
      else
        $stt = "00:00";
      if (!empty($course-> EndTimeTut))
        $ett = (string)$course-> EndTimeTut;
      else
        $ett = "00:00";
			$courses[(string)$course -> course_ID] = 
				   array('course_ID'   => (string)$course -> course_ID, 
				   	     'course_Name' => (string)$course -> course_Name,
				   		   'instructor'  => (String)$course -> instructor,
						     'startTime'   => (string)$course -> startTime,
						     'endTime'     => (string)$course -> endTime,
						     'StartTimeTut'=> $stt,
						     'EndTimeTut'  => $ett,
						     'daysOfWeek'  => (string)$course -> daysOfWeek);
		}
		return $courses;
	}
	
	//file2 contains list of all events, min and max
	public function parseFile2($file) 
	{
	$course_ids = array();
		
		if (file_exists($file))
		{
			$xml = @simplexml_load_file($file);
			if($xml ===  FALSE) 
			   return -1;
		}
		else 
		    return -2;
		$settings = array('events' => array(), 'min' => 1, 'max' => 1);	
		foreach($xml->Events->event as $e)
		{
			$settings['events'][] =
					array('event_ID'  => (string)$e -> event_ID,
				  		  'startTime' => (string)$e -> startTime,
			 	  		  'endTime'   => (string)$e -> endTime,
				  		  'daysOfWeek'=> (string)$e -> daysOfWeek);
		}
		
		foreach($xml->NumOfCourse as $num)
		{		
			$settings['min'] = (string)$num -> min;
			$settings['max'] = (string)$num -> max;
		}
		
		return $settings;
	}
	
	public function generateXmlFile($schedule)
	{	
		$output = "";
		$output .= "<schedule>\n";
		foreach($schedule as $course) {
			$output .= "\t<course>\n\t\t";
			$element = $course['course_ID'];
			$output .= "<course_ID>$element</course_ID>\n\t\t";

			$element = $course['instructor'];
      $output .= "<instructor>$element</instructor>\n\t\t";

			$element = $course['faculty'];
      $output .= "<faculty>$element</faculty>\n\t\t";

			$element = $course['description'];
      $output .= "<description>$element</description>\n\t\t";

			$element = $course['semester'];
      $output .= "<semester>$element</semester>\n\t\t";

			$element = $course['startDate'];
      $output .= "<startDate>$element</startDate>\n\t\t";

			$element = $course['endDate'];
      $output .= "<endDate>$element</endDate>\n\t\t";

			$element = $course['startTime'];
      $output .= "<startTime>$element</startTime>\n\t\t";

			$element = $course['endTime'];
      $output .= "<endTime>$element</endTime>\n\t\t";

			$element = $course['StartTimeTut'];
      if (!empty($element))
        $output .= "<StartTimeTut>$element</StartTimeTut>\n\t\t";

			$element = $course['EndTimeTut'];
      if (!empty($element))
        $output .= "<EndTimeTut>$element</EndTimeTut>\n\t\t";

			$element = $course['daysOfWeek'];
      $output .= "<daysOfWeek>$element</daysOfWeek>\n\t\t";

			$element = $course['course_Name'];
      $output .= "<course_Name>$element</course_Name>\n\t";

			$output .= "</course>\n\n";
		}
		$output .= "</schedule>\n\n\n";
		return $output;
	}

	public function xmlOutput($xml_out)
	{
    $xml_out = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<Schedules>\n" 
                . $xml_out . "</Schedules>";
		header('Content-Type: text/xml');
		header('Content-Disposition: attachment; filename="AllSchedules.xml"');
		header('Content-Transfer-Encoding: binary');
    echo $xml_out;
	}
}
?>
