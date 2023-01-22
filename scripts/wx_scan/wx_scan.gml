// https://rxjs.dev/api/operators/scan
function wx_scan(func, seed){
	return method({func : func, seed : seed}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					seed = func(seed, _val);
					observer.next(seed);
				},
				function(err){ observer.error(err); },
				function()	 { observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_scan");
	});
}