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