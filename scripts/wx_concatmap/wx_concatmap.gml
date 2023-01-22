// https://rxjs.dev/api/operators/concatMap
function wx_concatmap(inner_func){
	return method({
		inner_func	: inner_func, 
		active		: false, 
		finished	: false,
		queue		: [],
		inner_sub	: function(inner){
						inner.subscribe(__wxObserver(
						function(_nxt){ observer.next(_nxt);},
						function(_err){ observer.error(_err);},
						function(){ 
							if ( array_length(queue) > 0 ){
									inner_sub(queue[0]);
									array_delete(queue, 0, 1);
							} else {
								active = false;
								if ( !finished ){
									observer.complete();
								}
							}
						}));	
						}
		}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ 	
					
					var inner = inner_func(_val);
					if ( !active ){
						active = true;
						inner_sub(inner);
					} else array_push(queue, inner);
					
				}, 
				function(_err){ observer.error(_err); },
				function(){ 
					finished = false;
					if ( !active ){ 
						observer.complete(); 
					}
				}
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_concatmap");
	});
}