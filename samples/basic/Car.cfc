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
	 */
	property name="model" type="string";

	/**
	 * @blank false
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