/* .trace(OPTIONAL NAME)
	
	The following will produce this in the debug log:
	
	Wisecrack:		[ obj_trace_example ] piped [ 1, 2, 3 stream ]
	Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 1
	The data was: 1
	Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 2
	The data was: 2
	Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 3
	The data was: 3
	Wisecrack:		completed [ obj_trace_example ]
	Wisecrack:		teardown  [ 1, 2, 3 stream ]
	
	This is good for following the the pipeline of an observable. 
	You can turn ALL tracing off by setting
	
	WX_VERBOSE false
	
	in __wxConfig
*/
wx_of(1, 2, 3).trace("1, 2, 3, stream")
	.subscribe(
		function(v){show_debug_message("The data was: "+string(v));},
		function(){},
		game_end
	);