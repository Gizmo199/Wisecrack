// https://rxjs.dev/api/operators/switchMap
function wx_switchmap(inner_func){
	return method({
		
		inner_func	: inner_func, 
		inner_sub	: undefined, 
		outer		: true,
		inner		: false 
		
	}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					if ( inner_sub != undefined ) inner_sub.unsubscribe();	
					
					inner = true;
					inner_sub = inner_func(_val).subscribe(__wxObserver(
						
						function(_nxt){ observer.next(_nxt); },
						function(_err){ observer.error(_err); },
						function(){ 
							inner = false;
							if ( !outer ){
								observer.complete();
							}
						}
						
					));
				},
				function(_err){ observer.error(_err); },
				function(){
					outer = false;
					if ( !inner ) observer.complete();	
				}
			));
			return function(){ sub.unsubscribe(); };
			
		}, "wx_switchmap");
	});
}