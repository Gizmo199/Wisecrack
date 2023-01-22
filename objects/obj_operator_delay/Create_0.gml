/*	wx_delay(time)
	
	after 30 frames This will produce:
	a
	b
	c
	
	until we have taken 10 values using wx_take() in the final
	subscriber pipe.
*/

// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

wx_of("a", "b", "c").pipe(

	wx_delay(30),
	
).subscribe(observer);
