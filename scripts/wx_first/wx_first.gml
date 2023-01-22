// https://rxjs.dev/api/operators/first
function wx_first(){
	return method({done : false}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					if ( !done ){
							observer.next(_val); 
							done = true;
					} else	observer.complete();
				}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_first");
	});
}