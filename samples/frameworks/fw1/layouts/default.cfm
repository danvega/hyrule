<cfset baseURL = replace(cgi.script_name,'/index.cfm','')>

<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>FW/1 Sample App using Hyurle Validation</title>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements --> 
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]--> 
	
	<link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-1.2.0.min.css" rel="stylesheet" type="text/css">
	<link href="#baseURL#/assets/css/stylesheet.css" type="text/css" rel="stylesheet" >
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="#baseURL#/assets/js/jquery.tablesorter.min.js"></script>
		
	<script type="text/javascript">
	$(function() {
		/* 
		 * sortList:
		 * An array of instructions for per-column sorting and direction in the format: [[columnIndex, sortDirection], ... ] 
		 * where columnIndex is a zero-based index for your columns left-to-right and sortDirection is 0 for Ascending and 1 
		 * for Descending. A valid argument that sorts ascending first by column 1 and then column 2 looks like: [[0,0],[1,0]]
		 */
		$(".zebra-striped").tablesorter({ sortList: [[1,0]] });
		
		$('.close').click(function(){
			$(this).parent().slideToggle();
		});
	});
	</script>
		
</head>
<body>
	
	<div class="container">
		
		<div class="content-wrapper">
		
			<div class="row">
				<div id="header" class="span15  columns">
					<h1>Hyrule Catalog</h1>
					<ul class="tabs">
					  <li class="<cfif getSection() EQ 'main'>active</cfif>"><a href="#buildURL('main')#">Home</a></li>
					  <li class="<cfif getSection() EQ 'category'>active</cfif>"><a href="#buildURL('category')#">Categories</a></li>
					  <li class="<cfif getSection() EQ 'product'>active</cfif>"><a href="#buildURL('product')#">Products</a></li>
					</ul>
				</div>
			</div>
			
			<div class="row">
				<div class="span15 columns">
					#body#
				</div>
			</div>
		
		</div>
		
	</div>
	
</body>
</html>
</cfoutput>
