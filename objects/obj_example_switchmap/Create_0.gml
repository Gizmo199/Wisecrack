/*	wx_switchmap(function_that_returns_static_operator)
	
	the following will produce:
	1
	1
	1
	2
	4
	8
	3
	9
	27
	Done!
	
	This will switch the observables from 1 static operator 
	to a new static operator. 
	
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	function(){ show_debug_message("Done!"); game_end(); });

wx_of(1, 2, 3).pipe(
	wx_switchmap(function(v){
		return wx_of(v, power(v, 2), power(v, 3));	
	})
).subscribe(observer);