/**
 * In this example we just want to make sure nothing is blank
 */
component accessors="true" {
	
	/**
	 * @blank false
	 */
	property name="make" type="string";
	
	/**
	 * @blank false
	 * @range 3,5
	 */
	property name="model" type="string";

	/**
	 * @blank false
	 * @min 2012
	 */
	property name="year" type="numeric";
	
	/**
	 * @blank false
	 */	
	property name="color" type="string";
	
	public Car function init(){
		return this;
	}

}