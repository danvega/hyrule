component accessors="true" {

	/**
	 * @required true
	 */
	property String make;

	/**
	 * @required true
	 * @min 3
	 * @max 5
	 */
	property String model;

	/**
	 * @required true
	 * @min 2012
	 */
	property Numeric year;

	/**
	 * @required true
	 */
	property String color;

	public Car function init(){
		return this;
	}

}