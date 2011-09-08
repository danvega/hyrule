/**
 * Abstract component for constraints to extend
 * 
 * @author Daniel Vega
 */
component accessors="true" {
	
	property name="clazz";
	property name="constraintName";
	property name="constraintParamater";

	public boolean function validate(any target, any property, any value){		
		return processValidate(target,property,value);
	}
	
	/**
	 * I am the full class path of the constraint
	 * 
	 * @param target the constraint object
	 */	
	public void function setConstraintClass(any target){
		variables.constraintClass = getMetaData(arguments.target).name;
	}
	
	/**
	 * There are special variables that you can use in your validation rules
	 * This method will replace the variable with the actual value
	 */
	public any function getSpecialVar(any param){
		
		switch(arguments.param){
			case "$now" : {
				return now();
				break;
			}
		}
		
	}
	
	public boolean function isSpecialVar(param){
		return listFindNoCase("$now",param);
	}
}