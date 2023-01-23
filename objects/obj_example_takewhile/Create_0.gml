/*	wx_takewhile(condition_function)
	
	the following will produce:
	0
	1
	2
	3
	4
	5
	...
	
	until the condition is met, in this case checking
	if our value is less than 5. This effectively works 
	as a "wx_take()" and "wx_filter()" operator combined
*/

wx_from(array_create(10, "hello world")).pipe(

	wx_takewhile(function(v){ return v < 5 })

).subscribe(show_debug_message);