/** 
 * Application setup for Hyrule Samples
 */
component {
	
	// Application Settings
	this.name = "hyrule_samples";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	
	// ORM
	//this.ormenabled = true;
	this.ormenabled = false;
	this.ormSettings = {
		dbcreate = "update",
		datasource = "hellohyrule",
		eventhandling = true,
		cfclocation = ["/hyrule/samples/basicorm","/hyrule/samples/advancedorm"]
	};
	this.siteRoot = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings['/hyrule'] = this.siteRoot & "..\";
	
	public boolean function onApplicationStart(){
		application.hyrule = new hyrule.system.core.Hyrule();
		return true;
	}
	
	public void function onRequestStart(){		
		if(structKeyExists(url,"reload")){
			onApplicationStart();
			ormReload();
		}
	}
	
	public void function onRequestEnd(){
		
	}
	
}