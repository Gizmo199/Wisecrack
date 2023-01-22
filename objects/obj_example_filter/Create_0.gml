/*	wx_filter(condition_function)
	
	The following will produce
	hello world
	1
	2
	4
	5

*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

var result = wx_of(1, 2, { value: "hello world" }, 4, 5);

// Get only our struct
result.pipe(
	
	wx_filter(is_struct),
	wx_map(function(v){
		return v.value;	
	})
	
).subscribe(show_debug_message);

// Get only our numbers
result.pipe(
	
	wx_filter(function(v){
		return !is_struct(v);
	})
	
).subscribe(observer);