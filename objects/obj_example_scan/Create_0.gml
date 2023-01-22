/*	wx_scan(accumulator_function, starting_value)
	
	The following will produce:
	scanning...
	0
	scanning...
	1
	scanning...
	3
	scanning...
	6
	scanning...
	10
	scanning...
	15
	scanning...
	21
	scanning...
	28
	scanning...
	36
	scanning...
	45
	
	this works much like reduce, but will emit values for
	every 'next' event from the observable
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_interval(5).pipe(
	
	wx_tap(function(){ show_debug_message("scanning..."); }),
	wx_take(10),
	wx_scan(function(a, b){
		return a + b;	
	}, 0),
	
).subscribe(observer);