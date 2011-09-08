import hyrule.system.core.Settings;

/**
 * I handle setting the message
 */ 
component accessors="true" {

	property name="messages" type="array";
	property name="settingsBean";

	public ValidationMessage function init(Settings sbean){
		setSettingsBean(arguments.sbean);
		setMessages([]);		
		loadResourceBundle();
		return this;
	}
	
	public string function getMessage(String fullType,Struct prop){
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
				return replaceTemplateText(messages[x].message,prop);	
			}
		}
		
		// if you are here we couldn't find a message 
		throw(
			type="ValidationMessage"
			message="There is no message defined for type '#lcase(type)#'"
		);
		
	}
	
	// PRIVATE METHODS
	
	/**
	 * I will replace special variables in the properties file
	 */
	private string function replaceTemplateText(String message,Struct prop){
		var matches = reMatchNoCase("({)([\w])+?(})",arguments.message);
		var m = arguments.message;
		
		if( arrayLen(matches) ) {			
			for(var i=1; i<=arrayLen(matches); ++i){
				// are we replace the {property} or some special key {min},{max},{matches}
				if( matches[i] == '{property}'){					
					m = replaceNoCase(m,matches[i],humanize(arguments.prop.name),"all");				
				} else {
					var _key = replace(matches[i],"{","");
						_key = replace(_key,"}","");
					
					// if the special key {key} contains a string we need to humanize it
					var _keyValue = isNumeric(prop[_key]) ? prop[_key] : humanize(prop[_key]);
					
					m = replaceNoCase(m,matches[i],_keyValue,"all");
				}
			}
		}

		return m;
	}

	private void function loadResourceBundle(){			
		var dir = expandPath(getSettingsBean().getRbPath());
		var _rb = getSettingsBean().getRb();
		var _rbpath = dir & "/" & _rb;

		// read in the properties for the resource bundle
		if(findNoCase(".properties",_rb)){
			var f = fileOpen(_rbPath);
		} else {
			var f = fileOpen(_rbPath & ".properties");
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
	
	/**
	 * I don't rememember why I am returning a struct here but look into refactoring this
	 * and moving this to some kind of string utilities object'
	 */
	private string function humanize(String text){
		var loc = {};
		loc.returnValue = reReplace(arguments.text, "([[:upper:]])", " \1", "all"); 
		loc.returnValue = reReplace(loc.returnValue, "([[:upper:]]) ([[:upper:]]) ", "\1\2", "all"); 
		loc.returnValue = replace(loc.returnValue, "-", " ", "all"); 
		loc.returnValue = ucase(left(loc.returnValue,1)) & right(loc.returnValue,len(loc.returnValue)-1);			
		return loc.returnValue;		
	}
	
}