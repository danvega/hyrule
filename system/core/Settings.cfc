component accessors="true" {

	/**
	 * The ruleParsor the instance will use
	 * Valid Choices are ruleparser,xml,json
	 */
	property name="ruleParser" default="metadata";
	
	/**
	 * I am the path to the resource bundle folder. This folder
	 * contains all properties files. If you do not wish to create
	 * your own you can use the default.properties that ships with Hyrule
	 */
	property name="rbPath" default="/hyrule/system/i18n";

	/**
	 * The default resouce bundle to use with or without the .properties extention
	 */
	property name="rb" default="default";
	
	
	/**
	 * The constructor dynamically handles setting any params passed 
	 * in the config struct. If the parameter is not passed into the
	 * constructor we will use the property default upon instantation
	 */
	public Settings function init(Struct config){
		var props = getMetaData(this).properties;
				
		for(var i=1; i <= arrayLen(props); ++i ){
			if( structKeyExists(config,props[i].name) ){
				_setProperty(props[i].name,arguments.config[props[i].name]);				
			} else {
				_setProperty(props[i].name,props[i]['DEFAULT']);
			}
		}
				
		return this;
	}
	
	/**
	 * I will return a structure of all settings and their values
	 */
	public Struct function getMemento(){
		var props = getMetaData(this).properties;
		var config = {};

		for(var i=1; i <= arrayLen(props); ++i ){
			structInsert(config,props[i].name,_getProperty(props[i].name));					
		}
		
		return config;
	}
	
	/**
	 * Dynamic setter
	 */
	private void function _setProperty(required any name, any value){
		local.theMethod = this["set" & arguments.name];
	
		if (isNull(arguments.value)) {
			theMethod(javacast('NULL', ''));
		} else {
			theMethod(arguments.value);
		}
	}
	
	/** 
	 * Dynamic getter
	 */
	private string function _getProperty(required any name){
		return evaluate("get#arguments.name#()");
	}	

}