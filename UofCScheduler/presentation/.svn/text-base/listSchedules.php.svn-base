<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class = "body">
	
	<div class = "header">
		<img src = "../img/banner.png"/>
	</div>
	
	<?php include 'navi.php' ?>
	
	<div class = "content">
	<h1>List of Schedules</h1>
	<p>	
	<table class=schedule> <caption> Schedule list: </caption>
	<tr>
	<th scope="col"><i>Schedule</i></th>    
	<?php
	$dir = dirname(dirname(__FILE__));	
	
	function generate_form($crsArray)
	{
		$str = "";
		foreach ($crsArray as $course)
			$str = $str . "<input type = \"hidden\" name = \"courses[]\" value = $course /> ";
		return $str;
	}

  if (!empty($_POST['action']) and $_POST['action'] == 'xml')
  {
		if (!file_exists("$dir/uploads/xmlFile1.xml") or !file_exists("$dir/uploads/xmlFile2.xml"))
		{
			$output .= "Uploaded File not found";
			exit(0);
		}
		$is_xml = true;
  }
	else
	{
		$min = $_POST['min'];
		$max = $_POST['max'];
		$is_xml = false;
	}
	if (!$min)
		$min = 1;
	if (!$max)
		$max = 1;
	
	require_once "$dir/application/resolveConflict.php";
	require_once "$dir/application/xmlHandler.php";
	$xml = new xmlHandler();
	$xml_out = "";
	$rc = resolveConflict::getInstance($min, $max);
	$sList = $rc->getScheduleList($is_xml);
	$courseList = resolveConflict::getCourses();
	$count =0;
	$output = "";
	
	if ($is_xml)
		$mx = $rc->getMax();
	else
		$mx = $max;
	for($i=1; $i<=$mx; $i++) {
  		$output .= "<th scope=\"col\"><i>Course $i<i></th> \n";
  	}
   
   $output .= "<th scope=\"col\"><i> Display </i></th> \n
   <th scope=\"col\"><i> Export </i></th> \n </tr>";

	foreach ($sList as $schedule)
	{
			$output .= "<tr> <th scope=\"row\"> Schedule " . ($count+1) . "</th> \n";
			$crsArray = array();
			foreach($schedule as $course)
			{
				$output .= "<td>" . $courseList[$course]['course_ID'] . "</td> \n"; 
				$crsArray[] = $course;
			}
			for($i=1; $i<=$mx-count($schedule); $i++) {
				$output .= "<td>  </td> \n";				
			}
			
		  $output .= "<td class=\"buttons\"> 
       		<form action = \"displaySchedule.php\", method = \"post\">" .
					generate_form($crsArray);
			if ($is_xml)
        	$output .= "<input type=\"hidden\" name = \"action\" value=\"xml\" />";

			$output .= "<input type = \"submit\" value = \"Display\" />
			</form>
			</td>
			
			<td class=\"buttons\"> 		
			<form action = \"exportSchedule.php\", method = \"post\"> " . generate_form($crsArray);
			if ($is_xml)
        	$output .= "<input type=\"hidden\" name = \"action\" value=\"xml\" />";
			$output .= "<input type = \"submit\" value = \"Export\" />
			<select NAME = \"format\">
			<option VALUE = \"pdf\">PDF</option>
			<option VALUE = \"xml\">XML</option>
			<option VALUE = \"excel\">Excel</option>
			</select>
			</form>			
			</td>
			</tr>";
			$count++;
	}	
	echo $output;
	?>
	</table>
	</div>
	</div>
</body>
</html>
