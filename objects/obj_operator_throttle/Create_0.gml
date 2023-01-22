/*	wx_throttle(time)
	
	The following will produce
	waiting...
	waiting...
	1
	waiting...
	waiting...
	3
	waiting...
	waiting...
	5
	...
	
	until we have taken 10 values using wx_take(10) in the final
	subscriber pipe.
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_interval(1).pipe(
	wx_tap(function(){ show_debug_message("waiting..."); }),
	wx_throttle(2),
).pipe(
	wx_take(10)
).subscribe(observer);