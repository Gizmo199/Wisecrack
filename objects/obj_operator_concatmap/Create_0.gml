/*	wx_concatmap(function_that_returns_static_operator)
	
	the following will produce:
	delayed by: 60
	delayed by: 120
	Done!
	
	This example works like the mergemap example, 
	but instead runs the timers in order instead
	of returning the shorter timer first
	
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	function(){ show_debug_message("Done!"); game_end(); });

wx_of(120, 60).pipe(
	wx_concatmap(function(v){
		return wx_of("delayed by: "+string(v)).pipe(wx_delay(v));	
	})
).subscribe(observer);