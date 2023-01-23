/*	wx_fromevent(handler, name)
	
	Anytime a global mouse press occurs, This will produce:
	Mouse clicked : left/right/middle
	
*/
wx_fromevent(WX_GLOBAL, "mouse_press").pipe(
	
	wx_map(function(){
		var mb = [0, "left", "right", "middle"];
		return mb[mouse_button];
	})
	
).subscribe(function(v){ 
	show_debug_message("Mouse clicked: "+v) 
});