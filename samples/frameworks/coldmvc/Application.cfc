component extends="coldmvc.Application" {

	this.name = "coldmvc-userManager";
	this.ormSettings = {
		cfclocation = "config/",
		flushAtRequestEnd=false
	};
}