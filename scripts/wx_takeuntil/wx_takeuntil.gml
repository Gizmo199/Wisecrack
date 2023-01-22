// https://rxjs.dev/api/operators/takeUntil
function wx_takeuntil(trigger){
	return method({trigger : trigger}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){
					observer.next(_val);
				}, 
				function(_err){ observer.error(_err); },
				function(){ observer.complete(); }
			));
			
			sub.add(trigger.subscribe(
			__wxObserver(function()
			{ 
				observer.complete();
				sub.unsubscribe();
				
			})
			));
			return function(){ 
				sub.unsubscribe(); 
			};
			
		}, "wx_takeuntil");
	});
}