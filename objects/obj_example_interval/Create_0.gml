/*	wx_interval(time, *optional_call_function)
	
	This will indefinately produce values every 15 frames:
	1
	2
	3
	4
	5
	...
	
	and will only end when pressing the ESC key
	
	**NOTE**
	Intervals must be completed to stop. This includes functions
	like "wx_take" or "wx_takewhile" or ".unsubscribe()"
	
	for 1 off alarms that do not need to be cleaned up manually
	use "wx_timer(15)"
	
*/
wx_interval(15).subscribe(show_debug_message);
