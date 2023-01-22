/*	wx_pluck(struct_key_to_get)
	
	This will produce:
	1
	2
	undefined
	undefined
	6
	7
	undefined
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

var data = [
	{val : 1},
	{val : 2},
	{num : 3},
	[4,5],
	{val : 6},
	{val : 7},
	8
];
wx_from(data).pipe(

	wx_pluck("val")
	
).subscribe(observer);