component extends="wirebox.system.ioc.config.Binder" {

	function configure() {
		
		mapDirectory("hyrule.samples.frameworks.fw1.services");
		
		map("ValidationService")
			.to("hyrule.system.core.Hyrule")
			.asSingleton()
			.initWith({validator="annotation",rbPath="/hyrule/samples/frameworks/fw1/assets/i18n"});		
		
	}
  
}