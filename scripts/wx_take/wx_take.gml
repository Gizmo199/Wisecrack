// https://rxjs.dev/api/operators/take
function wx_take(num){
	return method({num : num, count : 0}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					count++;
					if ( count > num ){
						observer.complete();
						if ( self[$ "sub"] != undefined ) sub.unsubscribe();
					} else {
						observer.next(_val);
					}
				}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			return function(){ sub.unsubscribe(); };
			
		}, "wx_take");
	});
}