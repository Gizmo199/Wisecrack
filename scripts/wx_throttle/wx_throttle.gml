// https://rxjs.dev/api/operators/throttle
function wx_throttle(time){
	return method({time : time, marker : 0}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					if ( WX_TIME - marker >= time ){
						marker = WX_TIME;
						observer.next(_val);
					}
				}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_throttle");
	});
}