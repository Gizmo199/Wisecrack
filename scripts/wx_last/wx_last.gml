// https://rxjs.dev/api/operators/last
function wx_last(){
	return method({done : false, val : undefined}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ val = _val; }, 
				function(_err){ observer.error(_err); },
				function(){ 
					observer.next(val);
					observer.complete(); 
				}
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_last");
	});
}