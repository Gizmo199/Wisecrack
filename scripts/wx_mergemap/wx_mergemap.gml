// https://rxjs.dev/api/operators/mergeMap
function wx_mergemap(inner_func){
	return method({inner_func : inner_func, active : 0, outerdone: false}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){ 
					active++;
					inner_func(_val).subscribe(__wxObserver(
						function(_nxt){ observer.next(_nxt);},
						function(_err){ observer.error(_err);},
						function(){ 
							active--;
							if ( active == 0 && outerdone ){
								observer.complete();	
							}
						}
					));
				}, 
				function(_err){ observer.error(_err); },
				function(){ 
					outerdone = true; 
					if ( active == 0 ){
						observer.complete();	
					}
				}
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_mergemap");
	});
}