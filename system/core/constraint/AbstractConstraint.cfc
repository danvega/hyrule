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
		return processValidate(argumentCollection = arguments);
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
	 * I will return the entity name of an orm class or an empty string if it doesn't exist
	 */
	public String function getEntityName(Any target){
		var meta = getMetadata(arguments.target);
		var entity = "";

		if( structKeyExists(meta,"persistent") && meta.persistent ){
			if(structKeyExists(meta,"entity")){
				entity = meta.entity;
			} else if(structKeyExists(meta,"entityName")) {
				entity = meta.entityName;
			} else {
				if(structKeyExists(meta,"fullname")){
					entity = listLast(meta.fullname,".");
				}
			}
		}

		return entity;
	}

	public String function getPropertyName(Any target,String key){
		var meta = getMetadata(arguments.target);
		var property = arguments.key;

		for(var x=1; x <= arrayLen(meta.properties); ++x){
			if( findNoCase(arguments.key,meta.properties[x].name) ){
				return meta.properties[x].name;
			}
		}

		return property;
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
	
	public boolean function passOnNULL(){
		return true;
	}
	
	/** 
	 * I will return the id of an entity
	 */
	public any function getFieldTypeId(any entity){
		var meta = getMetaData(arguments.entity);
		var id = 0;
		
		for( var x=1; x <= arrayLen(meta.properties); x++){
			if( structKeyExists(meta.properties[x],"fieldtype") &&  meta.properties[x].fieldtype == "id"){
				id = meta.properties[x].name;
				break;
			}
		}
		
		return id;
	}	
}