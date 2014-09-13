<?php
/**
 * SENG 403 Software Development in Teams and Organizations, winter 2011
 * Deliverable 2: resolveConflictTest 
 * UofC Scheduler
 * Group 2
 */

$dir=dirname(dirname(__FILE__));
require_once "$dir/application/resolveConflict.php";

class resolveConflictTest extends PHPUnit_Framework_TestCase
{	
	/********************************************************************
	 *Attributes
	 ********************************************************************/
	public function testAttributes_courses()
    {
        $this->assertObjectHasAttribute('courses', resolveConflict::getInstance(1,2));
    }
    
	public function testAttributes_max()
    {
        $this->assertObjectHasAttribute('max', resolveConflict::getInstance(1,2));
    }
    
	public function testAttributes_min()
    {
        $this->assertObjectHasAttribute('min', resolveConflict::getInstance(1,2));
    }
    
	public function testAttributes_CoursesNum()
    {
        $this->assertObjectHasAttribute('coursesNum', resolveConflict::getInstance(1,2));
    }
    
	public function testAttributes_instance()
    {
        $this->assertObjectHasAttribute('instance', resolveConflict::getInstance(1,2));
    }
   
	/********************************************************************
	 *METHODS
	 ********************************************************************/
    public function testPrivateMethod_getAllCourses()
    {	
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('getAllCourses'));
    }
    
	public function testGetSubsetOfCourse()
    {
        $class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('getSubsetsOfCourses'));
    }
    
    public function testPrivateMethod_resetArrayFromPos()
    {
		$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('resetArrayFromPos'));
    }
	
    public function testPrivateMethod_sequenceArray()
    {
		$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('sequenceArray'));
    }
    
    public function testPrivateMethod_checkConflictInTwoCrs()
    {
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('checkConflictInTwoCrs'));
    }
    
	public function testGetInstance()
    {
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('getInstance'));
    }
    
	public function testGetCourses()
    {
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('getCourses'));
    }
    
	public function testSetCoursesNum()
    {
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('setCoursesNum'));
    }
    
	public function testGetScheduleList()
    {
    	$class = new ReflectionClass('resolveConflict');
    	$this->assertTrue($class->hasMethod('getScheduleList'));
    }
	
	/********************************************************************
	 *GET ALL COURSES / GET COURSES
	 ********************************************************************/ 
	public function testGetAllCourses_expectedBehaviour() 
	{   
	    $class = new ReflectionClass('resolveConflict');
	 	$method = $class->getMethod('getAllCourses');
	    $method->setAccessible(true);
	    
  		$courses = $method->invokeArgs(resolveConflict::getInstance(1,2), array());
		$this->assertEquals($courses, 0);
	}
	
	public function testGetAllCourses_arrayNotEmpty() 
	{   
	    $class = new ReflectionClass('resolveConflict');
	 	$method = $class->getMethod('getAllCourses');
	    $method->setAccessible(true);
	    
	    $obj = resolveConflict::getInstance(1,2);
	    $method->invokeArgs($obj, array());
			$crs = $obj->getCourses();
			$s = (empty($crs)? true : false);
			$this->assertFalse($s);
	}
	
	public function testGetCourses_arrayNotEmpty() 
	{   
	    $class = new ReflectionClass('resolveConflict');
	 	$method = $class->getMethod('getCourses');
	    $method->setAccessible(true);
	    
	    $obj = resolveConflict::getInstance(1,2);
	    
			$crs = $method->invokeArgs($obj, array());
			$s = (empty($crs)? true : false);
			$this->assertFalse($s);
	}
	
	/********************************************************************
	 *GET SUBSET OF COURSES
	 ********************************************************************/
	public function testGetSubsetOfCourses_courseCount()
	{
		$class = resolveConflict::getInstance(1,2);
	 	$param = array();
  		$courses = $class->getSubsetsOfCourses($param);
		$this->assertTrue($courses);	
		$this->assertEquals($param, array(0));	
	}
	
	public function testGetSubsetOfCourses_emptyArgument()
	{
		$obj = resolveConflict::getInstance(1,2);
		$param = array();
		$obj->setCoursesNum(1);
		$val = $obj->getSubsetsOfCourses($param);
		$this->assertTrue($val);	
	}
	
	public function testGetSubsetOfCourses_NULLs()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		$param = NULL;
		
	 	$method = $class->getMethod('getAllCourses');
	    $method->setAccessible(true);
	    $courses = $method->invokeArgs($obj, array());
	    
	    $courses = $obj->getSubsetsOfCourses($param);
		$this->assertTrue($courses);	
	}
	
	public function testGetSubsetOfCourses_paramNotAnArray()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		$param = array();
		
	 	$method = $class->getMethod('getAllCourses');
	    $method->setAccessible(true);
	    $courses = $method->invokeArgs($obj, array());
		
	    $param = 'this is not an array';
  		$courses = $obj->getSubsetsOfCourses($param);
		$this->assertFalse($courses);
	}
	
	public function testGetSubsetOfCourses_expectedReturnedBehaviour()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		$param = array();
		
	 	$method = $class->getMethod('getAllCourses');
	    $method->setAccessible(true);
	    $courses = $method->invokeArgs($obj, array());
		
	    $param = array(1,2);
  		$courses = $obj->getSubsetsOfCourses($param);
			$this->assertFalse($courses);
	}
	
	public function testGetSubsetOfCourses_expectedBehaviourOnReference()
	{
		$obj = resolveConflict::getInstance(1,4);
		$param = array(3,4,5);
		$obj->setCoursesNum(6);
	  $obj->getSubsetsOfCourses($param);
		$this->assertEquals($param, array(0,1,2,3));	
	}
	
	public function testGetSubsetOfCourses_expectedBehaviourOnReferenceUpperLimit()
	{
		$obj = resolveConflict::getInstance(3,6);
		$param = array(0,1,2,3,4,5);
		$obj->setCoursesNum(6);
	  $obj->getSubsetsOfCourses($param);
		$this->assertEquals($param, array(0,1,2,3,4,5));	
	}
	
	public function testGetSubsetOfCourses_expectedBehaviourOnReferenceEmptyArray()
	{
		$obj = resolveConflict::getInstance(1,4);
		$param = array();
		$obj->setCoursesNum(6);
		$obj->getSubsetsOfCourses($param);
		$this->assertTrue(is_array($param));	
	}
	
	public function testGetSubsetOfCourses_expectedBehaviourOnReferenceLowerLimit()
	{
		$obj = resolveConflict::getInstance(1,2);
		$param = array(1);
		$obj->setCoursesNum(6);
	    $obj->getSubsetsOfCourses($param);
		$this->assertEquals($param, array(2));	
	}
	
	public function testGetSubsetOfCourses_expectedBehaviourOnReferenceMinEqualMax()
	{
		$obj = resolveConflict::getInstance(1,1);
		$param = array(1);
		$obj->setCoursesNum(6);
	    $obj->getSubsetsOfCourses($param);
		$this->assertEquals($param, array(2));	
	}
	
	/********************************************************************
	 *GET INSTANCE
	 ********************************************************************/
	public function testGetInstance_instanceNull()
	{
		$obj = NULL;
		$this->assertNull($obj);
	}
	
	public function testGetInstance_instanceNotNull()
	{
		$obj = resolveConflict::getInstance(1,4);
		$this->assertNotNull($obj);	
	}
	/********************************************************************
	 *CHECK CONFLICT IN TWO COURSES
	 ********************************************************************/
	public function testCheckConflictInTwoCoursesNoConflictsDiffDays()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
	
		$crs1 = array('daysOfWeek' => "TH", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "11:59", 'endTime' => "12:30");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertFalse($result);
	}
	
	public function testCheckConflictInTwoCoursesNoConflictsDiffTimes()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
	
		$crs1 = array('daysOfWeek' => "F", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "12:00", 'endTime' => "12:30");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertFalse($result);
	}
	
	public function testCheckConflictInTwoCoursesNoConflictsDiffTimes2()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
	
		$crs1 = array('daysOfWeek' => "M", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "10:00", 'endTime' => "11:00");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertFalse($result);
	}

	public function testCheckConflictInTwoCoursesWithConflicts1MinOverlapping()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
		$crs1 = array('daysOfWeek' => "MWF", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "11:59", 'endTime' => "12:30");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertTrue($result);
	}

	public function testCheckConflictInTwoCoursesWithConflictsSameTime()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
		$crs1 = array('daysOfWeek' => "MWF", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "F", 'startTime' => "11:00", 'endTime' => "12:00");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertTrue($result);
	}
	
	public function testCheckConflictInTwoCoursesWithConflictsSameTimeFirstDay()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
		$crs1 = array('daysOfWeek' => "M", 'startTime' => "11:00", 'endTime' => "12:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "09:00", 'endTime' => "11:01");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertTrue($result);
	}
  
  public function testCheckConflictInTwoCoursesWithStartEndTimeTheSame()
	{
		$class = new ReflectionClass('resolveConflict');
		$obj = resolveConflict::getInstance(1,2);
		
	 	$method = $class->getMethod('checkConflictInTwoCrs');
	 	$method->setAccessible(true);
		$crs1 = array('daysOfWeek' => "M", 'startTime' => "11:00", 'endTime' => "11:00");
		$crs2 = array('daysOfWeek' => "MWF", 'startTime' => "09:00", 'endTime' => "11:00");
	 	$result = $method->invokeArgs($obj, array($crs1, $crs2));
		$this->assertFalse($result);
	}

	/********************************************************************
	 *GET SCHEDULE LIST
	 ********************************************************************/
}
?>
