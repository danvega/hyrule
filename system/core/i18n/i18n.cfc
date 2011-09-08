import hyrule.system.core.Settings;

component accessors="true" {

	property name="settingsBean";

	public any function init(Settings sbean){
		setSettingsBean(arguments.sbean);
		return this;
	}

	/**
	 * locale is determined in this order
	 * 
	 *  1.) has a locale been passed to the validate function, if so use it
	 *  2.) is there a resource bundle for the current locale / getLocaleShort()-check for file
	 *  3.) look for an default.properties, if you can't find one throw an error'
	 */
	public string function getResourceBundle(String locale=""){				
		
		// 1
		if( len(arguments.locale) ){
			return arguments.locale;
		}
		
		// 2
		var short = getLocaleShort();
		var bundlePath = expandPath(getSettingsBean().getRbPath() & '/' & short & '.properties');
		
		if( fileExists(bundlePath) ){
			return short;
		}
		
		// 3
		if( fileExists(expandPath(getSettingsBean().getRbPath() & '/' & 'default' & '.properties')) ){
			return 'default';
		} else {
			throw(
				type="i18n",
				message="Unable to find default messages properties file."
				detail="We are unable to locate the default messages file 'default.properties' in the resource bundle path '#getSettingsBean().getRbPath()#'"
				);
		}
		
	}

	/** 
	 * I will return language_country (en_us)
	 */
	private string function getLocaleShort(){
		var locale = createObject("java","java.util.Locale").getDefault();
		var short = locale.getLanguage() & '_' & locale.getCountry();
		return short;
	}
	
}