/*	wx_timer(time, *optional_call_function)
	
	after 30 frames this will produce:
	Timer completed at: 
	30
	
	and end the game after 60 frames
	
	**NOTE**
	Timers do not reset. They are one off events. 
	Closer to alarm[0] = 60 and then never resetting the alarm
	
	for alarms that reset use "wx_interval(60)"
	
*/
wx_timer(30, function(){
	
	show_debug_message("Timer completed at:");	
	
}).subscribe(show_debug_message);
wx_timer(60).subscribe(game_end);
