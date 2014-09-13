<?php
$dir = dirname(dirname(__FILE__));
$format = "";
if (!empty($_POST['courses']))
	$courses = $_POST['courses'];
if (!empty($_POST['format']))
	$format = $_POST['format'];
if (!empty($_POST['action']) and $_POST['action'] == 'xml')
	$is_xml = true;
else
  $is_xml = false;
if (!empty($_POST['download']) and $_POST['download'] == 'yes')
{
	if (!file_exists("$dir/uploads/xmlFile1.xml") or !file_exists("$dir/uploads/xmlFile2.xml"))
	{
		$output .= "Uploaded File not found";
		exit(0);
	}
	$dlXml = true;
}
else
	$dlXml = false;

require "$dir/application/getFinalSchedule.php";
require_once "$dir/application/xmlHandler.php";
if ($dlXml)
{	
	require_once "$dir/application/resolveConflict.php";
	$xml = new xmlHandler();
	$xml_out = "";
	$rc = resolveConflict::getInstance(1, 1);
	$sList = $rc->getScheduleList(true);
	$courseList = resolveConflict::getCourses();
	foreach ($sList as $schedule)
	{
			foreach($schedule as $course)
				$crsArray[] = $courseList[$course];
			$xml_out .= $xml->generateXmlFile($crsArray);
	}
	$xml->xmlOutput($xml_out);
}
elseif ($format != 'xml')
{
	$output = "";
	$output .= "<html>\n<head>\n";
	$output .= "</head>\n<body>\n<center>\n<div class = \"content\">\n";
	$output .= generate_schedule($courses, $is_xml);
	$output .= "\n</div>\n</center>\n</body>\n</html>"; 
}

if($format == 'pdf')
{
	require "$dir/application/pdfgen/html2fpdf.php";
	
	$pdf=new HTML2FPDF('L', 'mm', 'A4');
	$pdf->AddPage();
	
	$pdf->UseCSS();
	$pdf->WriteHTML($output);
	$pdf->Output("Schedule.pdf", 'D');
}
elseif ($format == 'excel')
{
	$outFile = "$dir/presentation/output/Schedule.xls";
	chmod("$dir/presentation/output/Schedule.xls", 0777);
	$file = fopen($outFile, 'w') or die("Can't open file");
	chmod("$dir/presentation/output/Schedule.xls", 0777);
	$written = fwrite($file, $output);
	if(!$written)
		echo "Error writing to file, is this server windows? If so, exportScheudle has to be modified.\n";
	fclose($file);
	header( "Location: output/Schedule.xls" );
}
elseif ($format == 'xml')
{
	$xml = new xmlHandler();
	$crsArray = getScheduleCourses($courses, $is_xml);
	$xml_out .= $xml->generateXmlFile($crsArray);
	$xml->xmlOutput($xml_out);
}
elseif ($format != "")
{
	echo "<html><body>Fatal error, no format or input recieved.</body></html>";
}
?>

