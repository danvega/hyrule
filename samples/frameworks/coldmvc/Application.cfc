component extends="coldmvc.Application" {

	// Application properties
	this.name = "coldmvc-hyrule" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,90,0);
	this.setClientCookies = true;
	
	// ORM SETTINGS
	this.ormEnabled = true;
	this.datasource = "hellohyrule";
	this.ormSettings = {
		dbcreate = "update",
		eventhandling = true,
		flushAtRequestEnd = false,
		cfclocation = '/hyrule/samples/frameworks/coldmvc/app/model',
		logsql = true,
		useDBForMapping = false,
		secondaryCacheEnabled = false
	};
	
	public void function onRequestStart(){
		super.onRequestStart();
		
		if(structKeyExists(url,"reload")){
			ormReload();
		}
	}
}