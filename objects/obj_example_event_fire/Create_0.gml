/*	wx_event_fire(name)
	
	This function will return either an object_index or undefined (for WX_GLOBAL).
	You can make "wx_fromevent" listen to any object_index, as when 
	"wx_event_fire" is called, it sends data from the "event_object" variable
	of the caller.
	
	Anytime an event is fired occurs, This will produce some
	code or message
	
*/
speed = 10;
var keypress = wx_fromevent(object_index, "spacebar");
var outside  = wx_fromevent(object_index, "outside-room");

// Keypress event 
keypress.subscribe(function(v){
	show_debug_message("Spacebar was pressed!");
	direction += 15;
});

// Outside room event
outside.subscribe(function(){ move_wrap(true, true, 0); });
outside.pipe(

	wx_map(function(obj){ return object_get_name(obj); })

).subscribe(function(name){
	show_debug_message(name);
	direction += 45;	
})