component accessors="true" {

	property name="make" required="true";
	property name="model" required="true";
	property name="year" required="true";
	property name="color" required="true";

	public Car function init(){
		return this;
	}

}