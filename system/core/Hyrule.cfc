import hyrule.system.core.result.ValidationResult;
import hyrule.system.core.validator.ValidatorFactory;
import hyrule.system.core.i18n.i18n;
import hyrule.system.core.Settings;

component accessors="true" {
	
	/**
	 * Validator factory that loads a collection of validators
	 */	
	property name="validatorFactory" type="ValidatorFactory";

	/**
	 * Internationalization Utility
	 */
	property name="i18n" type="i18n";
	
	/**
	 * Hyrule Settings Bean
	 */	
	property name="settingsBean";
	
	/**
	 * Hyrule construct handles configuration and creation of factories
	 */	
	public Hyrule function init(Struct config={}){		
		setSettingsBean( new Settings(config) );				
		setValidatorFactory( new ValidatorFactory(getSettingsBean()) );		
		seti18n( new i18n(getSettingsBean()) );
		return this;
	}
	
	/**
	 * Main purpose of the hyrule framework is to validate an object. This method is 
	 * delegated to the appropriate validator which is created by our validator factory
	 */
	public ValidationResult function validate(required any target, string context="*",string locale=""){
		// determine our resource bundle properties file
		var rb = getI18N().getResourceBundle(arguments.locale);
		// set the rb	
		getSettingsBean().setRB(rb);
		
		var validator = getValidatorFactory().getValidator(target);
		
		return validator.validate(target,context);
	}
	
}