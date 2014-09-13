<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
	<?php 
		if (!empty($_POST['eName']))
		{
			$dir = dirname(dirname(__FILE__));
			require_once("$dir/application/Event.php");
			$event = new Event();
			if ($event->addEvent($_POST) == 0)
				echo "You have successfully added the event $eventName.";
			else
				echo "Failed to add an event.";
		}
	?>
	<h1>Custom Events</h1>
	<p>
	Here you can add your own personal events to your schedule.
	
	<form action = "customEvent.php", method = "post">
	<table>
	<tr><td width = "50%">Event Name: </td><td><input type = "text" name = "eName" /></td></tr>
	<tr><td width = "40%">Start Time: </td><td>
	<select NAME = "sTime">
<?php
	function printOptions($start, $end)
	{
		for ($time=$start; $time<=$end; $time++)
		{
			if ($time <10)
			{
				echo "<option VALUE = \"0$time:00\">0$time:00</option>";
				echo "<option VALUE = \"0$time:30\">0$time:30</option>";
			}
			else
			{
				echo "<option VALUE = \"$time:00\">$time:00</option>";
				echo "<option VALUE = \"$time:30\">$time:30</option>";
			}
		}
	}
	printOptions(8,20);
?>
	</select>
	</td></tr>	
	<tr><td width = "40%">End Time: </td><td>
	<select NAME = "eTime">
	<option VALUE = "08:30">08:30</option>";
	<?php printOptions(9,20); ?>
	<option VALUE = "21:00">21:00</option>";
	</select>
	</td></tr>
	<tr><td width = "30%">Days of the week: </td>
		<td><input type = checkbox name = eDaysOfWeek[] value = "N" />Sunday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "M" />Monday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "T" />Tuesday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "W" />Wednesday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "R" />Thursday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "F" />Friday<br />
			<input type = checkbox name = eDaysOfWeek[] value = "S" />Saturday
		</td>
	</tr>
	<tr><td width = "30%"><input type = "submit" value = "Add Event" /></td></tr>
	<?php 
	/*if(empty($_POST['eDaysOfWeek'])) {
		print("Please select one or more day(s) of the week.");
	}
	if(isset($_POST['Submit'])) {
		if($_POST['sTime'] >= $_POST['eTime'])
			print("Start time must be before end time.");*/
	?>
	</table>
	
	</form>
	
	<br></br>
	</p>
	</div>
	</div>
</body>
</html>
