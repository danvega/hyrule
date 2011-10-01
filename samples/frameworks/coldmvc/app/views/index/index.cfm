<h3>Product Sales</h3>
<cfchart format="flash" scalefrom="0" scaleto="2000" chartwidth="880">
	<cfchartseries type="bar" serieslabel="Product Sales By Month" seriescolor="##6699CC">
		<c:each in="#sales#" do="month">
			<cfchartdata item="#month.name#" value="#month.value#" />
		</c:each>
	</cfchartseries>
</cfchart>