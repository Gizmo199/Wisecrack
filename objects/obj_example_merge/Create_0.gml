/*	wx_merge(obs1, obs2, obs3,...)
	
	this produces
	1
	2
	3
	4
	5
	hello
	world
	
*/

// We can create an observer to also subscribe to our streams to set next and complete calls.
// What our observer should to during the Next, Error, and Complete calls.
var observer =	wx_observer(
/*next:		*/	show_debug_message, 
/*error:	*/	function(){}, 
/*complete: */	game_end);

var obs1 = wx_of(1, 2, 3, 4, 5);
var obs2 = wx_from(["hello", "world"]);

wx_merge(obs1, obs2).subscribe(observer);