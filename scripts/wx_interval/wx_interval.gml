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
		
		timer = new __wxAlarm(time, true, method({
			observer: observer, 
			func	: func,
			count	: count
		}, function(){ 
			func();
			observer.next(count++); 
		}),	scheduler);
		count++;
		return function(){ timer.destroy(); }
	}), "wx_interval");
}	