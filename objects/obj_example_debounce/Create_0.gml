/*	wx_debounce(time)
	
	After 60 frames The following will produce
	5
	
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_of(1, 2, 3, 4, 5).pipe(

	wx_debounce(60)

).subscribe(observer);