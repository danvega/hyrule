component accessors="true" {

	property name="resourceBundle" type="string";
	property name="messages" type="array";

	public ValidationMessage function init(required String rb){
		setResourceBundle(arguments.rb);
		setMessages([]);
		loadResourceBundle();
		return this;
	}
	
	public string function getMessage(String fullType){
		var messages = getMessages();
		var constraint = listGetAt(fullType,listLen(fullType,'.'),'.');
		var property = listGetAt(fullType,listLen(fullType,'.')-1,'.');
		var domain = lcase(listGetAt(fullType,listLen(fullType,'.')-2,'.'));
		var type = domain & '.' & property & '.' & constraint;
		
		for(i=1; i <= arrayLen(messages); ++i){
			if(messages[i].type == type){
				return messages[i].message;
			}
		}
		
		for(x=1; x<= arrayLen(messages); ++x){
			if(messages[x].type == constraint){
				return replaceTemplateText(messages[x].message,property);	
			}
		}
		
		// if you are here we couldn't find a message 
		throw(
			type="ValidationMessage"
			message="There is no message defined for type '#lcase(type)#'"
		);
		
	}
	
	// PRIVATE METHODS
	private string function replaceTemplateText(String message, String prop){
		var matches = reMatchNoCase("({)([\w])+?(})",arguments.message);
		var m = arguments.message;
		
		if( arrayLen(matches) ) {			
			for(var i=1; i<=arrayLen(matches); ++i){
				m = replaceNoCase(m,matches[i],humanize(arguments.prop),"all");				
			}
		}

		return m;
	}

	private void function loadResourceBundle(Boolean isAbsolutePath=false){
		var dir = expandPath('/hyrule/');
		var rbPath = dir & "resources/" & getResourceBundle();

		// read in the properties for the resource bundle
		if(findNoCase(".properties",getResourceBundle())){
			var f = fileOpen(rbPath);
		} else {
			var f = fileOpen(rbPath & ".properties");
		}

	    while(!fileIsEOF(f)) {
	        var x = fileReadLine(f);
	        // if line is not a comment or empty line
	        if( !findNoCase('##',x) && len(x) ){
				var type = listFirst(x,"=");
				var message = listLast(x,"=");
				arrayAppend(getMessages(),{type=type,message=message});	        	
	        }
	    }

	}

	
	private string function humanize(String text){
		var loc = {};
		loc.returnValue = reReplace(arguments.text, "([[:upper:]])", " \1", "all"); 
		loc.returnValue = reReplace(loc.returnValue, "([[:upper:]]) ([[:upper:]]) ", "\1\2", "all"); 
		loc.returnValue = replace(loc.returnValue, "-", " ", "all"); 
		loc.returnValue = ucase(left(loc.returnValue,1)) & right(loc.returnValue,len(loc.returnValue)-1);	
		return loc.returnValue;		
	}
	
}