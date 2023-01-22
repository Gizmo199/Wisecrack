/*	wx_mergemap(function_that_returns_static_operator)
	
	the following will produce:
	Delayed by: 60
	Delayed by: 120
	Done!
	
	In this example, No matter what order you put the '120, 60'
	values this operator simply merges the observables and will 
	always produce the 'shorter' timer first.
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	function(){ show_debug_message("Done!"); game_end(); });

wx_of(120, 60).pipe(
	wx_mergemap(function(v){
		return wx_of("Delayed by: "+string(v)).pipe(wx_delay(v));
	})
).subscribe(observer);