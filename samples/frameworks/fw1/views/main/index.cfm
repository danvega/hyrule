<cfoutput>

	<h3>Product Sales</h3>
	<cfchart format="flash" scalefrom="0" scaleto="2000" chartwidth="880">
		<cfchartseries type="bar" serieslabel="Product Sales By Month" seriescolor="##6699CC">
			<cfchartdata item="January" value="1000">
			<cfchartdata item="February" value="800">
			<cfchartdata item="March" value="500">
			<cfchartdata item="April" value="887">
			<cfchartdata item="May" value="1200">
			<cfchartdata item="June" value="1450">
			<cfchartdata item="July" value="455">
			<cfchartdata item="August" value="1733">
			<cfchartdata item="September" value="1500">
			<cfchartdata item="October" value="599">
			<cfchartdata item="November" value="678">
			<cfchartdata item="December" value="456">			
		</cfchartseries>
	</cfchart>

</cfoutput>