// https://rxjs.dev/api/operators/reduce
function wx_reduce(func, seed){
	return method({func : func, seed: seed}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ seed = func(seed, _val); }, 
				function(_err){ observer.error(_err); },
				function(){ 
					observer.next(seed);
					observer.complete(); 
				}
			));
			return function(){ with ( sub ) unsubscribe(); };
		}, "wx_reduce");
	});
}