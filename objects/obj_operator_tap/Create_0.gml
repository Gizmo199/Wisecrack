/*	wx_tap(function_call)
	
	every 10 frames the following will produce:
	Result : 10,
	1
	Result : 20,
	2
	Result : 30,
	3
	Result : 40,
	4
	Result : 50,
	5
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
	wx_tap(function(number){
		show_debug_message("Result : "+string(number * 10));
	})
);

result.pipe(
	wx_take(10)
).subscribe(observer);