component extends="fw1.org.corfield.framework" {

	this.name = "fw-usermanager";
	this.applicationtimeout = createTimeSpan(0,1,0,0);
	this.sessionmanagement = true;
	this.sessiontimeout = createTimeSpan(0,0,60,0);
	
	// ORM Settings
	this.ormenabled = "true";
	this.ormsettings = {
		datasource = "fw1usermanager",
		cfclocation = "models",
		dbcreate = "update",
		flushatrequestend = false
	};
	
	// fw/1 settings
	variables.framework = {
		defaultSection = "dashboard",
		defaultItem = "index"
		,error = "error"
		,reloadApplicationOnEveryRequest = true
	};
	
	public void function setupApplication(){
		local.cs = new coldspring.beans.defaultXmlBeanFactory();		
		cs.loadBeans( getDirectoryFromPath(getCurrentTemplatePath()) & "conf\beans.xml");
		setBeanFactory(cs);	
	}

	public void function setupSession(){
	
	}

	public void function setupRequest(){
	
	}
	
}
