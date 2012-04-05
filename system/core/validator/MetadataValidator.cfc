import hyrule.system.core.result.ValidationResult;

component accessors="true" extends="BaseValidator" implements="IValidator" {

	public ValidationResult function validate(required any target, string context="*"){
		var meta = getMetaData(target);
		var properties  = getProperties(meta);	
		var result = new ValidationResult(getValidationMessage());

		// now that we have the properties attach any constraints
		properties = addConstraints(properties,target);

		for(var x=1; x<= arrayLen(properties); ++x) {
			var name = properties[x].name;
					
			// instead of just looping over each key in properties, loop over a sorted list	
			for(key in properties[x]){
				var type = meta.name & "." & name & "." & key; 

				// is this key a valid constraint, if so lets validate this
				if( listFindNoCase(getConstraintList(),key) ){
					
					// if the key in this constraint does not contain a context then we always validate
					// if it does contain a context then we only validate this if the context matches
					if( arguments.context == "*" || listFindNoCase(arguments.context,name) ) {
						
						var obj = getConstraints()[key];						
						// the value of the property
						var value = evaluate("target.get#properties[x].name#()");					
						// set the constraint property
						obj.setConstraintParameter(properties[x][key]);				

						if( isNull(value) ){
							// if the value is null the constraint check has failed, no need to validate the value
							result.addError(meta.name,'property',properties[x],key);
						} else {
							if( !obj.validate(target,properties[x].name,value) ){
								result.addError(meta.name,'property',properties[x],key);
							}
						}						
					}
				
				} else {

					// special cases

					switch( key ) {
						case "validator" : {
							var method = listLast(properties[x][key],".");
							var clazz = replaceNoCase(properties[x][key],'.' & method,"");
							var instance = createObject(clazz);

							if( !evaluate("instance.#method#('#evaluate("target.get#properties[x].name#()")#')") ){
								result.addError(meta.name,'property',properties[x],key);
							}
							break;								
						}
					}
					
				}							
			}

		}
			
		return result;	
	}
	
	/**
	 * I will take the properties array and add constraints to it based on the public property constraints 
	 * that will be defined in the target object
	 */
	private Array function addConstraints(Array properties,Any target){
		var constraints = target.constraints;
		var props = arguments.properties;

		// loop over the array of properties in the target object
		for(var x=1; x <= arrayLen(props); ++x){
			// if the constraints struct contains this property
			if(structKeyExists(constraints,props[x].name)){
				// we need to loop over the struct for this key and add all of the constraints to the property
				for(var constraint in constraints[props[x].name]){
					// hack for type
					if( constraint == "type" ) {
					 	props[x]["isvalid"] = constraints[props[x].name][constraint];
					} else {
						props[x][constraint] = constraints[props[x].name][constraint];	
					}			
				}
			}
		}

		return props;
	}

}