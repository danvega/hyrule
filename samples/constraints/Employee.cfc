/**
 * @accessors true
 * @extends User
 */
component {

	property Numeric salary;

	this.constraints.salary = {required=true};

	public Employee function init(){
		return this;
	}


}