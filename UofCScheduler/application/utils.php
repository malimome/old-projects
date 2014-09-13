<?php
/*
 * A class to have all various needed functions related to time, date, conversions and other stuff.
 */
class TimeUtils
{
	// Converts Hour format to a format understandable by the schedule page.
	public function convertHour($hour)
	{
			return str_replace(":", "", $hour);
	}

	// Converts weekday abbrv to number
	private function char2Num($char)
	{
		$ret = 0;
		switch ($char)
		{
			case 'M': $ret = 1; break;
			case 'T': $ret = 2; break;
			case 'W': $ret = 3; break;
			case 'R': $ret = 4; break;
			case 'F': $ret = 5; break;
			case 'S': $ret = 6; break;
			case 'N': $ret = 7; break;
			default: $ret = -1;
		}
		return $ret;
	}
	
	// Converts semester abbreviation to number
	private function semester2Num($semester)
	{
	    $ret = 0;
		switch ($semester)
	  	{
		   case "FALL": $ret = 0; break;
		   case "WINTER": $ret = 1; break;
		   case "SPRING": $ret = 2; break;
		   case "SUMMER": $ret = 3; break;
		   default: $ret = -1;
	  	}
	 	return $ret;
	 }

	// It extracts all days in a string like "MWF" into an array of the corresponding numbers
	public function extractWeekDays($daysW)
	{
		$days = array();
		for ($i=0; $i<strlen($daysW); $i++)
		{
			$days[] = $this->char2Num($daysW[$i]);
		}
		return $days;
	}

	// Calculates the difference between two dates
	private function get_time_difference( $start, $end )
	{
			date_default_timezone_set("America/Edmonton");
	    $uts['start']      =    strtotime( $start );
	    $uts['end']        =    strtotime( $end );
	    if( $uts['start']!==-1 && $uts['end']!==-1 )
	    {
	        if( $uts['end'] >= $uts['start'] )
	        {
	            $diff    =    $uts['end'] - $uts['start'];
	            if( $days=intval((floor($diff/86400))) )
	                $diff = $diff % 86400;
	            if( $hours=intval((floor($diff/3600))) )
	                $diff = $diff % 3600;
	            if( $minutes=intval((floor($diff/60))) )
	                $diff = $diff % 60;
	            $diff    =    intval( $diff );            
	            return( array('days'=>$days, 'hours'=>$hours, 'minutes'=>$minutes, 'seconds'=>$diff) );
	        }
	        else
	        {
	            trigger_error( "Ending date/time is earlier than the start date/time", E_USER_WARNING );
	        }
	    }
	    else
	    {
	        trigger_error( "Invalid date/time data detected", E_USER_WARNING );
	    }
	    return( false );
	}

	// Calculates the difference between two times in minutes
	public function timeDiff($start, $end)
	{
		$diff = $this->get_time_difference($start, $end);
		return $diff['hours']*60 + $diff['minutes'];
	}
	
}
	
?>
	
	
	
