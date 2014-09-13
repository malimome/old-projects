<?php
/**
 * SENG 403 Software Development in Teams and Organizations, winter 2011
 * Deliverable 2: XML Handler Test 
 * UofC Scheduler
 * Group 2
 */

$dir=dirname(dirname(__FILE__));
require_once "$dir/application/xmlHandler.php";

class xmlHandlerTest extends PHPUnit_Framework_TestCase
{	
	/********************************************************************
	 *METHODS
	 ********************************************************************/
    public function testMethod_parseFile1()
    {	
    	$class = new ReflectionClass('xmlHandler');
    	$this->assertTrue($class->hasMethod('parseFile1'));
    }
    
	 public function testMethod_parseFile2()
    {	
    	$class = new ReflectionClass('xmlHandler');
    	$this->assertTrue($class->hasMethod('parseFile2'));
    }
    
	 public function testMethod_generateXmlFile()
    {	
    	$class = new ReflectionClass('xmlHandler');
    	$this->assertTrue($class->hasMethod('generateXmlFile'));
    }
    
	/********************************************************************
	 *PARSE FILE1
	 ********************************************************************/
    public function testParseFile1_expectedBehaviour()
	{
		global $dir;
		$file = "$dir/tests/testFiles/testFile1.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile1($file);
		
		$expected = array('CPSC441'=>array('course_ID'=>'CPSC441',
										 'course_Name'=>'CPSC 441',
										 'instructor'=>'Yaser', 
										 'startTime'=> '12:00', 
										 'endTime'=> '12:50', 
										 'StartTimeTut'=> '00:00', 
										 'EndTimeTut'=> '00:00', 
										 'daysOfWeek'=>'MWF'),
						  'CPSC471'=>array('course_ID'=>'CPSC471', 
						  				 'course_Name'=>'CPSC 471',
										 'instructor'=>'Majid',
										 'startTime'=> '15:00', 
										 'endTime'=> '15:50', 
										 'StartTimeTut'=> '00:00', 
										 'EndTimeTut'=> '00:00', 
										 'daysOfWeek'=>'MWF'));
		
		$this->assertEquals($courses, $expected);
	}
	
	public function testParseFile1_fileDoesNotExist()
	{
		global $dir;
		$file = "$dir/tests/testFiles/whereIsTheFile.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile1($file);
		
		$this->assertEquals($courses, -2);
	}
	
	public function testParseFile1_tagSyntaxMismatch()
	{
		global $dir;
		$file = "$dir/tests/testFiles/tagMismatchTestFile1.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile1($file);
		$this->assertEquals($courses, -1);
	}
	
	public function testParseFile1_wrongClassTagSyntax()
	{
		global $dir;
		$file = "$dir/tests/testFiles/wrongClassTagSyntaxTestFile1.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile1($file);
		
		$expected = array('CPSC471'=>array('course_ID'=>'CPSC471', 
										'course_Name'=>'CPSC 471', 
										'instructor'=>'Majid', 
										'startTime'=> '15:00', 
										'endTime'=> '15:50', 
										 'StartTimeTut'=> '00:00', 
										 'EndTimeTut'=> '00:00', 
										'daysOfWeek'=>'MWF'));
		
		$this->assertEquals($courses, $expected);
	}
	
	public function testParseFile1_functionReturnsEmptyArray()
	{
		global $dir;
		$file = "$dir/tests/testFiles/forceEmptyArrayReturnTestFile1.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile1($file);
		$this->assertEquals($courses, array());
	}
	
	/********************************************************************
	 *PARSE FILE2
	 ********************************************************************/
	public function testParseFile2_expectedBehaviour()
	{
		global $dir;
		$file = "$dir/tests/testFiles/testFile2.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile2($file);
		
		$expected = array('events'=>array(array('event_ID'=>'YOGA1', 'startTime'=>'11:00', 'endTime'=>'11:50', 'daysOfWeek'=>'MWF'),
				array('event_ID'=>'YOGA2', 'startTime'=>'11:00', 'endTime'=>'11:50', 'daysOfWeek'=>'T')),
				 'min'=>'2', 'max'=>'4');
		
		$this->assertEquals($courses, $expected);
	}
	
	public function testParseFile2_fileDoesNotExist()
	{
		global $dir;
		$file = "$dir/tests/testFiles/whereIsTheFile.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile2($file);
		
		$this->assertEquals($courses, -2);
	}
	
	public function testParseFile2_tagSyntaxMismatch()
	{
		global $dir;
		$file = "$dir/tests/testFiles/tagMismatchTestFile2.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile2($file);
		$this->assertEquals($courses, -1);
	}
	
	public function testParseFile2_wrongClassTagSyntax()
	{
		global $dir;
		$file = "$dir/tests/testFiles/wrongClassTagSyntaxTestFile2.xml";
		$obj = new xmlHandler();
		$courses = $obj->parseFile2($file);
		
		$expected = array('events'=>array(array('event_ID'=>'YOGA2', 'startTime'=>'11:00', 'endTime'=>'11:50', 'daysOfWeek'=>'T')),
				 'min'=>'2', 'max'=>'4');
		
		$this->assertEquals($courses, $expected);
	}
	
	/********************************************************************
	 *GENERATE XML FILE
	 ********************************************************************/
	
}
?>
