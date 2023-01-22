/*	wx_takeuntil(observable_trigger)
	
	every 15 frames the following will produce:
	0
	1
	2
	3
	4
	5
	...
	
	until our timer observable completes
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

timer = wx_timer(60);
wx_interval(10).pipe(
	
	wx_takeuntil(timer)
	
).subscribe(observer);
