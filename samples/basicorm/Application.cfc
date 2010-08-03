component  {
	this.name = hash(getDirectoryFromPath(getCurrentTemplatePath()));
	this.ormEnabled = true;
	this.ormsettings = {
		datasource="hyruleorm",
		dbcreate="update",
		useDBForMapping=true
	};
}