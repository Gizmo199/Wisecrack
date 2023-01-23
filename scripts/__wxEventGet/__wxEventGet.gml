function __wxEventGet(handler, name){	
	if ( WX_LISTENERS[$ handler] == undefined ){
		WX_LISTENERS[$ handler] = {};
	}
	if ( WX_LISTENERS[$ handler][$ name] == undefined ){
		WX_LISTENERS[$ handler][$ name] = new __wxEventCaller();
	}
	return WX_LISTENERS[$ handler][$ name];
}