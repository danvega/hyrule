component accessors="true" {

	property name="firstname" type="string" required="true";
	property name="lastname" type="string" required="true";
	property name="age" type="numeric" required="true" min="18";

	public Person function init(){
		return this;
	}
}