function __wxEventFire(name){
	var  listeners = WX_LISTENERS[$ event_object];
	if ( listeners == undefined ) return;
	if ( listeners[$ name] != undefined ){
		 listeners[$ name].call();
	}
}