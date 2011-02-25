component extends="lightfront.org.lightfront.lightfront" {

	this.name = "lightfront_" & hash(getCurrentTemplatePath()) & hash(cgi.script_name);
	this.applicationTimeout = createTimeSpan(2,0,0,0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.mappings["/lfront"] = "c:\www\lightfront";

	public void function onApplicationStart(){
		var settings = {
			defaultClass = "user",
			defaultMethod = "list"
		};
		
		var lfront = {
			settings = settings,
			ctrl = loadControllers()
		};
		
		loadSettings(settings);
		application.lfront = lfront;		
	}
	
	public boolean function onRequestStart(String targetPage){
		onApplicationStart();
		loadRequest();
		return true;
	}
	
}