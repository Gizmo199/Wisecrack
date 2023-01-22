// https://rxjs.dev/api/index/function/timer
function wx_timer(time, func=function(){}, scheduler=WX_SCHEDULER){
	return new __wxObservable(method(
	{
		time: time, 
		func: func,
		scheduler: scheduler,
	}, 
	function(_observer){
		observer = _observer;
		
		timer = new __wxAlarm(time, false, function(){ 
			func();
			observer.next(time); 
		},	scheduler);
		
		return function(){ timer.destroy(); }
	}), "wx_timer");
}	