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
		$dir = dirname(dirname( __FILE__));
		require_once "$dir/application/resolveConflict.php";

    function displayFile($file, $name)
    {
      global $dir;
      $target_path = "$dir/uploads/$name.xml";

		  if(move_uploaded_file($file['tmp_name'], $target_path)) {
			  echo "The file ".  basename($file['name'])." has been uploaded". "<br />";
			  echo "Type: " . $file["type"] . "<br />";
        echo "Size: " . ($file["size"] / 1024) . " Kb<br />";
        return true;
		  } else{
        echo "There was an error uploading the file, please try again!<br /><br />";
        return false;
		  }
    }
   	$ret1 = displayFile($_FILES['file1'], "xmlFile1");
   	$ret2 = displayFile($_FILES['file2'], "xmlFile2");
   	if ($ret1 and $ret2)
 	 	{
     	$str = "<form action = \"listSchedules.php\", method = \"post\" />
       	<input type=\"hidden\" name = \"action\" value=\"xml\" />
       	<input type=\"submit\" value=\"Display Schedules\" /></form>";
     	$str .= "<form action = \"exportSchedule.php\", method = \"post\" />
       	<input type=\"hidden\" name = \"download\" value=\"yes\" />
       	<input type=\"submit\" value=\"Download Schedules\" /></form>";
     	echo $str;
 	 	}
	?>
	</div>
	</div>
</body>
</html>
