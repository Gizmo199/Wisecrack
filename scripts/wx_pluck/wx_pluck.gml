// https://rxjs.dev/api/operators/pluck
function wx_pluck(value){
	return method({value : value}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ 
					if ( !is_struct(_val) ){
						observer.next(undefined);
						return;
					}
					observer.next(_val[$ value]);
				}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_pluck");
	});
}