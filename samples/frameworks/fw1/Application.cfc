component extends="lib.org.corfield.framework" {
	
	// Application properties
	this.name = "fw1hyrule" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,90,0);
	this.setClientCookies = true;
	
	// MAPPINGS
	this.mappings["/wirebox"] = getDirectoryFromPath(getCurrentTemplatePath()) & "lib\wirebox";
	
	// ORM SETTINGS
	this.ormEnabled = true;
	this.datasource = "hellohyrule";
	this.ormSettings = {
		dbcreate = "update",
		eventhandling = true,
		flushAtRequestEnd = true,
		cfclocation = "/hyrule/samples/frameworks/fw1/model",
		logsql = true,
		useDBForMapping = false,
		secondaryCacheEnabled = false
	};
	
	// FW/1 - configuration:
	variables.framework = {
		defaultItem="index",
		defaultSection="main",
		home = "main.index",
		reloadApplicationOnEveryRequest = true
	};
	
	public void function setupApplication(){
		var bf = new lib.wirebox.system.ioc.adapters.WireBoxAdapter( definitionFile="assets.config.binder" );		
		bf.createFactory();
		setBeanFactory( bf );
	}
	
	public void function setupRequest(){

		//ORM Reload
		if( structKeyExists(URL,"ORMReload") ){
			ORMReload();
		}
				
	}
	
}