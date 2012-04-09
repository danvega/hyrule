/**
 * Application setup for Hyrule Samples
 */
component {

	// Application Settings
	this.name = "hyrule_samples";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);

	this.ormenabled = true;
	this.ormSettings = {
		dbcreate = "update",
		datasource = "hyrule",
		eventhandling = true,
		cfclocation = ["/hyrule/samples/basicorm"]
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