/*	wx_generate(start_value, condition_function, iteration_function)
	
	this produces
	1
	2
	3
	
	this function is essentially a for() loop. 
	
*/
wx_generate(0,						
	function(i){ return i<3; },		
	function(i){ return i+1; })		
	.subscribe(show_debug_message);
game_end();
