/*	wx_set_timeout(time, func)
	
	This function will create a simple alarm that calls a function
	when it is completed.
	
*/

wx_set_timeout(60, function(){
	show_debug_message("Done!");
	game_end();
});