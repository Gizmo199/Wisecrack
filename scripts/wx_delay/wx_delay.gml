// https://rxjs.dev/api/operators/delay
function wx_delay(time){
	return method({time : time, queue: []}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ 
					var timer = new __wxAlarm(time, false, method({queue: queue, observer: observer, val: _val}, 
					function(){ 
						observer.next(val); 
						array_delete(queue, 0, 1);
						if ( array_length(queue) <= 0 ) observer.complete();
					}));
					array_push(queue, timer);
					
				}, 
				function(_err){ observer.error(_err); },
				function(){}
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_delay");
	});
}