/*	wx_fromevent(handler, name)
	
	Anytime a global mouse press occurs, This will produce:
	Mouse clicked : left/right/middle
	
*/
// Show keypresses
wx_fromevent(WX_GLOBAL, "mouse_press").pipe(
	
	wx_map(function(data){
		switch(data){
			case mb_left	: return "Left";
			case mb_right	: return "Right";
			case mb_middle	: return "Middle";
		}
		return "Mouse press";
	})
	
).subscribe(function(v){ 
	show_debug_message("Mouse clicked: "+v) 
});

// End game
wx_fromevent(WX_GLOBAL, "keypress").pipe(

	wx_filter(function(){
		return ( keyboard_key == vk_escape );	
	})
	
).subscribe(function(){ game_end(); });