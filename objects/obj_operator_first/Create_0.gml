/*	wx_first()
	
	this will produce
	59

*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_of(59, 328, 10993).pipe(

	wx_first(),
	
).subscribe(observer);