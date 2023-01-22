// https://rxjs.dev/api/index/function/interval
function wx_interval(time, func=function(){}, scheduler=WX_SCHEDULER){
	return new __wxObservable(method(
	{
		time: time, 
		func: func,
		scheduler: scheduler,
		count: 0
	}, 
	function(_observer){
		observer = _observer;
		
		timer = new __wxAlarm(time, true, function(){ 
			func();
			observer.next(count++); 
		},	scheduler);
		
		return function(){ timer.destroy(); }
	}), "wx_interval");
}	