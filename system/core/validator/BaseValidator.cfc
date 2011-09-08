import hyrule.system.core.constraint.ConstraintFactory;
import hyrule.system.core.result.ValidationResult;

component accessors="true" {

	property name="constraintFactory";
	property name="validationMessage";

	public array function getProperties(Struct meta){
		var props = [];
		
		if( structKeyExists(meta,"constraints") ){
				for(var x=1; x <= arrayLen(meta.constraints); x++){
					arrayAppend(props,meta.constraints[x]);
				}				
		} else {
			if( !isNull(meta.properties) ){
				for(var x=1; x <= arrayLen(meta.properties); x++){
					arrayAppend(props,meta.properties[x]);
				}			
			}
			
			// check for inherited properties
			if( structKeyExists(meta,"extends") && structKeyExists(meta.extends,"properties")){			
				for(var i=1; i <= arrayLen(meta.extends.properties); i++){
					arrayAppend(props,meta.extends.properties[i]);
				}
			}
		}

		return props;		
	}

	public struct function getConstraints(){		
		return getConstraintFactory().getConstraints();
	}
	
	public string function getConstraintList(){
		return getConstraintFactory().getConstraintList();
	}

}