// https://rxjs.dev/api/index/function/fromEvent
function wx_fromevent(ev_object, ev_name, scheduler=WX_SCHEDULER){
	return new __wxObservable(method(
	{
		scheduler: scheduler,
		event : __wxEventGet(ev_object, ev_name)
	}, 
	function(_observer){
		observer = _observer;
		callfunc = function(){
			observer.next();
		}
		event.add(callfunc)
		
		return function(){ event.remove(callfunc); }
	}), "wx_fromevent");
}	