import hyrule.system.core.ruleParser.*;
import hyrule.system.core.constraint.ConstraintFactory;
import hyrule.system.core.Settings;

component accessors="true" {

	property name="cache" type="struct";
	property name="settingsBean";

	public RuleParserFactory function init(Settings sbean) {
		variables.cache = {};
		variables.settingsBean = arguments.sbean;
		return this;
	}
	
	public IRuleParser function getRuleParser(){
		var obj = javaCast("null","");
		var type = getSettingsBean().getRuleParser();				
		
		// if we find it in the cache
		if( structKeyExists(getCache(),type) ){
			obj = getCache()[type];
		} else {
			// cache it and return it
			switch(type){			
				case "metadata" : {
					obj = new MetadataRuleParser();
					break;
				}
				case "xml" : {
					obj = new XmlRuleParser();
					break;
				}
				case "json" : {
					obj = new JSONRuleParser();
					break;
				}				
				default : {
					obj = new MetadataRuleParser();					
					break;					
				}
			}
			variables.cache[type] = obj;
		}		
		
		// set the constraint factory in our parsor object
		obj.setConstraintFactory( new ConstraintFactory() );		
		
		return obj;
	}
		
}