component accessors="true" {

	property firstName;
	property lastName;
	property age;
	
	// class constraints
	include "/hyrule/system/metadata.cfm";
	metadata.constraints = [
		{name="firstName",blank=false},
		{name="lastName",blank=false},
		{name="age",numeric=true}	
	];
	
	public Person function init(){
		return this;
	}
	
}