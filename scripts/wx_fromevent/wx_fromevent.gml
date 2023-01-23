// https://rxjs.dev/api/index/function/fromEvent
function wx_fromevent(ev_object, ev_name, scheduler=WX_SCHEDULER){
	return new __wxObservable(method(
	{
		scheduler	: scheduler,
		object		: ev_object,
		event		: __wxEventGet(ev_object, ev_name)
	}, 
	function(_observer){
		observer = _observer;
		callfunc = method({
			
			observer : observer, 
			object: object
			
			}, function(){observer.next(is_string(object) ? undefined : object);})
		event.add(callfunc)
		
		return function(){ event.remove(callfunc); }
	}), "wx_fromevent");
}	