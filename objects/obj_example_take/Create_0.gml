/*	wx_take(number)
	
	the following will produce:
	0
	1
	2
	3
	4
	5
	...
	
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10).pipe(
	
	wx_take(5)
	
).subscribe(observer);
