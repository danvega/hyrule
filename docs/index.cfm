<cfsetting showdebugoutput="false">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Hyrule Validation Framwork</title>
	<link href="docs.css" type="text/css" rel="stylesheet">
</head>
<body>

	<h1>Hyrule Validation Framwork</h1>

	<ol>
		<li><a href="#introduction">Introduction</a></li>
		<li><a href="#installation">Installation</a></li>
		<li><a href="#usage">Using Hyrule</a></li>		
		<li>
			<a href="#constraints">Constraints</a>
			<ol>
				<li><a href="#constraints-prebaked">Built in constraints</a></li>
				<li><a href="#constraints-custom">Custom Constraints</a></li>
				<li><a href="#using-constraints">Using Constraints</a></li>
			</ol>
		</li>
		<li>
			<a href="#errormessages">Error Messages</a>
			<ol>
				<li><a href="#errormessages-default">Default Error Messages</a></li>
				<li><a href="#errormessages-custom">Custom Error Messages</a></li>
				<li><a href="#errormessages-perproperty">Per Property Error Messages</a></li>
			</ol>
		</li>
		<li><a href="#support">Support</a></li>
		<li><a href="#download">Download</a></li>
	</ol>

	<hr/>

	<h2 id="introduction">Introduction</h2>
	<p>Validation has always been a tedious process that I wanted to rid my self of. I have used various frameworks that are out and many iterations of my own. I don't think you can really use other frameworks until you understand the problem and how the problem is solved. With that In mind I wanted to tackle my own validation framework. The idea for this framework really came from 2 sources. I really enjoyed the way the QuickSilver framework was using annotations in there framework so I thought I would do the same. The other source of inspiration was the hibernate validation frameowrk. That framework does the same thing for validation and many of my constraints, example and documentation text come from that framework.
	<p>Annotations are a very convenient and elegant way to specify invariant constraints for a domain model. You can, for example, express that a property should never be null, that the account balance should be strictly positive, etc. These domain model constraints are declared in the bean itself by annotating its properties. A validator can then read them and check for constraint violations</p>

	<hr/>

	<h2 id="installation">Installation</h2>
	<p>The Hyrule validation frameowrk can be installed a couple different ways. The easiest is to just drop
	the hyrule folder in to your webroot. If you do not wish to do that you can always drop it anywhere on disk or
	even in your project somewhere and then just create a mapping to it. With per application mappings this is very easy. Imagine you have a
	project called HelloHyrule and you wanted to drop the hyrule framework in the lib folder. <br/><br/>

		+ HelloHyrule<br/>
		  - css<br/>
		  - images<br/>
		  - lib<br/>
		    - hyrule<br/>
		  - Application.cfc<br/><br/>

		In your application component you can create a per application mapping for the framework.<br/>
		<code>
			this.mappings["/hyrule"] = expandPath("lib/hyrule");
		</code>

	</p>

	<hr/>
	
	<h2 id="usage">Using Hyrule</h2>
	<p>
		The framework is pretty simple. 
		<ul>
			<li>Create an instance of your object and run any setters</li>
			<li>Create an instance of the hyrule validator (You can store this as a singleton)</li>
			<li>Pass an object that has constraints attached to its properties</li>
			<li>Call the validate method and pass in your object</li>
			<li>The validate method will return a ValidationResult object</li>
		</ul>
	</p>
	<p><img src="images/using_hyrule.PNG"></p>


	<p>
		Now that you have the ValidationResult object you can take advantage of the 2 main methods it exposes.
		You can see an example array of errors below.
		<ul>
			<li>hasErrors() - Returns a boolean</li>
			<li>getErrors() - Returns an error of ValidationError objects</li>
		</ul>
	</p>
	
	<p><img src="images/array_of_errors.PNG">
	
	<hr/>	

	<h2 id="constraints">Constraints</h2>

	<strong id="constrints-prebaked">Built In Constraints</strong>
	<p>The following is a list of built in constraints you can use on your object properties.</p>

	<cffile action="read" file="#expandPath('constraints.xml')#" variable="xml">
	<cfset xmlConstraints = xmlParse(xml)>
	<cfset constraints = xmlSearch(xmlConstraints,"//constraint")>

	<table width="100%" cellpadding="0" cellspacing="0" border="1">
		<thead>
			<tr>
				<th>Constraint</th>
				<th>Usage</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#constraints#" index="constraint">
			<cfoutput>
			<tr>
				<td>#constraint.xmlChildren[1].xmlText#</td>
				<td>#constraint.xmlChildren[2].xmlText#</td>
				<td>#constraint.xmlChildren[3].xmlText#</td>
			</tr>
			</cfoutput>
			</cfloop>
		</tbody>
	</table>

	<br/><br/>

	<strong id="constrints-custom">Custom Constraints</strong>
	<p>There are going to be times when the built in constraints just aren't enough. In these cases you need
	the ability to create your own validation constraints. To accomplish this you need to create a custom
	validator component. To create your own validator you just need to add the custom annotation to your
	property and give it the fully qualified path for the validator.</p>

	<p>
		<span style='color:#000000'><span style='color:#990033'>&lt;cfscript&gt;</span><span style='color:#000000'><br /><span style='color:#AAAAAA'>/**<br />&#32;*&#32;@output&#32;false<br />&#32;*&#32;@accessors&#32;true<br />&#32;*/</span><br />component&#32;<span style='color:#000099'>{</span><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#AAAAAA'>/**<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*&#32;@display&#32;First&#32;Name<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*&#32;@NotEmpty<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*/</span><br />&nbsp;&nbsp;&nbsp;&nbsp;property&#32;string&#32;firstname;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#AAAAAA'>/**<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*&#32;@display&#32;Last&#32;Name<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*&#32;@NotEmpty<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*/</span><br />&nbsp;&nbsp;&nbsp;&nbsp;property&#32;string&#32;lastname;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#AAAAAA'>/**<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*&#32;@custom&#32;hyrule.samples.custom.isUniqueUsername<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*<br />&nbsp;&nbsp;&nbsp;&nbsp;&#32;*/</span><br />&nbsp;&nbsp;&nbsp;&nbsp;property&#32;username;<br /><br /><span style='color:#000099'>}</span><br /></span><span style='color:#990033'>&lt;/cfscript&gt;</span>
	</p>

	<p>
		The framework now understands what custom validator to use. To create a custom validator
		you need to implement then hyrule.validator.IValidator interface. This will check to make
		sure that your custom validator follows the same pattern as the rest of the validators. Your custom
		validator will need 2 methods, isValid and getMessage. This example is calling a service that will do the database lookup for us.
		With the built in constraints and the ability to write your own validators there should be a way to run checks on any type of
		data.<br/><br/>

		<span style='color:#000000'><span style='color:#990033'>&lt;cfscript&gt;</span><span style='color:#000000'><br />component&#32;implements=<span style='color:#006600'>"hyrule.validator.IValidator"</span>&#32;<span style='color:#000099'>{</span><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;public&#32;boolean&#32;function&#32;isValid(Struct&#32;prop,&#32;val)<span style='color:#000099'>{</span><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&#32;valid&#32;=&#32;true;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&#32;userService&#32;=&#32;new&#32;UserService();<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#AAAAAA'>//&#32;database&#32;lookup&#32;to&#32;see&#32;if&#32;its&#32;valid.&#32;returns&#32;true&#32;if&#32;username&#32;is&#32;found<br /></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(userService.getByUsername(val))<span style='color:#000099'>{</span><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;valid&#32;=&#32;false;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#000099'>}</span><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&#32;valid;<br />&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#000099'>}</span><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;public&#32;string&#32;function&#32;getMessage(Struct&#32;prop,String&#32;message)<span style='color:#000099'>{</span><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&#32;<span style='color:#006600'>"That&#32;username&#32;already&#32;exists&#32;in&#32;our&#32;system.&#32;Please&#32;choose&#32;another&#32;username."</span>;<br />&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:#000099'>}</span><br /><br /><span style='color:#000099'>}</span><br /></span><span style='color:#990033'>&lt;/cfscript&gt;</span><br /></span>
	</p>
	
	
	<strong id="using-constraints">Using Constraints</strong>
	<p>
		The one thing I hear a lot from other developers when looking at Hyrule is that they really don't
		like my Javadoc annotation style. I fully understand and the most important thing is that your enjoy
		writing the code your writing, nobody is right. With that said they are just annoations so we can use 
		constraints a couple different ways.
	</p>
	
	<strong>Javadoc Syntax</strong>
	<p>
		The first way to use your constraints is using the Javadoc syntax. This is the style you will find in 
		most of the examples. Remember that the Javadoc syntax starts with a /** not a /*.
	</p>
	<p><img src="images/using_constraints_javadoc.PNG"</p>
	
	<strong>Script Based Syntax</strong>
	<p>
		You can also use the script based syntax for creating prperties.
	</p>
	<p><img src="images/using_constraints_script.PNG"</p>

	<strong>Tag Based Syntax</strong>
	<p>And yes, you can still even use good old tag based syntax.</p>
	<p><img src="images/using_constraints_tag.PNG"</p>
	

	<hr/>

	<h2 id="errormessages">Error Messages</h2>

	<strong id="errormessages-default">Default Error Messages</strong>
	<p>Hyrule Validator comes with a default set of error messages translated in about 0 languages (if yours is not part of it, please help us out by sending us a patch). If you have suggestions for better default error messages please let me know.</p>

	<table width="100%" cellpadding="0" cellspacing="0" border="1">
		<thead>
			<tr>
				<th>Constraint</th>
				<th>Type</th>
				<th>Default Error Message</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#constraints#" index="constraint">
			<cfoutput>
			<tr>
				<td>#constraint.xmlChildren[1].xmlText#</td>
				<td>#constraint.xmlChildren[5].xmlText#</td>
				<td>#constraint.xmlChildren[4].xmlText#</td>
			</tr>
			</cfoutput>
			</cfloop>
		</tbody>
	</table>
	<br/><br/>

	<strong id="errormessages-custom">Custom Error Messages</strong>
	<p>Hyrule gives you the ability to create your own custom messages. When you instatiate the hyrule validation framework the constructor
	has an argument of type string that is the properties file you want to use. By default Hyrule will look in the hyrule/resources folder
	for the DefaultValidatorMessages.properties file. If you want to copy that file and create your own messages you can. Just copy and
	paste a new file into the resources file and then refer to the file in the constructor. You can enter the path name with or without
	.properties and it will find the file.<br/><br/>

	<span style='color:#000000'><span style='color:#990033'>&lt;cfset<span style='color:#000000'>&#32;hyrule&#32;=&#32;createObject(<span style='color:#006600'>"component"</span>,<span style='color:#006600'>"hyrule.validator"</span>).init(<span style='color:#006600'>"MyValidatorMessages"</span>)</span>&gt;</span><br /></span>
	<br/><br/>

	There will be better support for error handling here and for the ability to store these property files in your project in the near future.
	<br/><br/>

	<strong id="errormessages-perproperty">Per Property Error Messages</strong>
	<p>If you want to override any of the messages loaded by the framework and just create your own error message you can. You can only
	define 1 custom error message per property so if you have multiple validators for a property you need to create a generic message. To
	create your own message just use the @message annotation.</p>

	<span style="color: rgb(0, 0, 0);"><span style="color: rgb(170, 170, 170);">/**<br> * @output false<br> * @accessors true<br> */</span><br>component <span style="color: rgb(0, 0, 153);">{</span><br><br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(170, 170, 170);">/**<br>&nbsp;&nbsp;&nbsp;&nbsp; * @display First Name<br>&nbsp;&nbsp;&nbsp;&nbsp; * @NotEmpty<br>&nbsp;&nbsp;&nbsp;&nbsp; */</span><br>&nbsp;&nbsp;&nbsp;&nbsp;property string firstname;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(170, 170, 170);">/**<br>&nbsp;&nbsp;&nbsp;&nbsp; * @display Last Name<br>&nbsp;&nbsp;&nbsp;&nbsp; * @NotEmpty<br>&nbsp;&nbsp;&nbsp;&nbsp; * @message You better provide a last name dude!<br>&nbsp;&nbsp;&nbsp;&nbsp; */</span><br>&nbsp;&nbsp;&nbsp;&nbsp;property string lastname;<br><br><span style="color: rgb(0, 0, 153);">}</span><br></span>

	</p>

	<hr/>

	<h2 id="support">Support</h2>
	<p>
		<strong>Project Home:</strong> <a href="http://hyrule.riaforge.org" target="_blank">http://hyrule.riaforge.org</a><br/>
		<strong>Author:</strong> Dan Vega<br/>
		<strong>Blog:</strong> <a href="http://www.danvega.org/blog/" target="_blank">http://www.danvega.org/blog/</a><br/>
		<strong>Email:</strong> <a href="mailto:danvega@gmail.com">danvega@gmail.com</a><br/>
		<strong>Google Group:</strong> <a href="http://groups.google.com/group/hyrule-validator">Hyrule Validator Google Group</a>
		<br/>
	</p>

	<h2 id="download">Download</h2>
	<p><a href="http://hyrule.riaforge.org">http://hyrule.riaforge.org</a></p>

</body>
</html>