/*	wx_map(function_call_that_returns)
	
	every 10 frames the following will produce:
	10,
	20,
	30,
	40, 
	50,
	...
	
	until we have taken 10 values using wx_take() in the final
	subscriber pipe.
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

var result = wx_interval(10).pipe(
	wx_map(function(number){
		return number * 10;	
	})
);

result.pipe(
	wx_take(10)
).subscribe(observer);