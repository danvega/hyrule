import hyrule.system.core.Validator.*;
import hyrule.system.core.result.ValidationMessage;
import hyrule.system.core.constraint.ConstraintFactory;
import hyrule.system.core.Settings;

component accessors="true" {

	property name="cache" type="struct";
	property name="settingsBean";

	public ValidatorFactory function init(Settings sbean) {
		variables.cache = {};
		variables.settingsBean = arguments.sbean;
		return this;
	}
	
	public any function getValidator(required any target){
		var obj = javaCast("null","");
		var type = getSettingsBean().getValidator();		
		
		// if we find it in the cache
		if( structKeyExists(getCache(),type) ){
			obj = getCache()[type];
		} else {
			// cache it and return it
			switch(type){
				case "annotation" : {
					obj = new AnnotationValidator();
					break;
				}				
				case "metadata" : {
					obj = new MetadataValidator();
					break;
				}
				case "xml" : {
					obj = new XmlValidator();
					break;
				}
				case "json" : {
					obj = new JSONValidator();
					break;
				}				
				default : {
					obj = new AnnotationValidator();					
					break;					
				}
			}
			variables.cache[type] = obj;
		}		
		
		// set the constraint factory in our validator object
		obj.setConstraintFactory( new ConstraintFactory() );		
		// validataionMessage is a singleton so we need to pass it in
		obj.setValidationMessage(new ValidationMessage( getSettingsBean() ) );
		
		return obj;
	}
		
}