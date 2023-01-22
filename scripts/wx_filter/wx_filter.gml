// https://rxjs.dev/api/operators/filter
function wx_filter(func){ 
	return method({func : func}, function(_source){ 
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ if ( func(_val) ){ observer.next(_val); }}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_filter");
	});
}