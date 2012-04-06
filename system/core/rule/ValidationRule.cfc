component accessors="true"{
	property string propertyName;
	property string constraintName;
	property string constraintValue;
	property string context;
	
	
	ValidationRule function init(){
		return this;
	}
	
	//overriding this setter to handle the "typeCase"
	void function setConstraintName(required string name){
		if(arguments.name == 'type')
			variables.constraintName = 'isValid';
		else
			variables.constraintName = arguments.name;
		
	}
	

}