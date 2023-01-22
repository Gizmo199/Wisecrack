// https://rxjs.dev/api/index/function/merge
function wx_merge(){	
	
	var i = 0;
	var args = [];
	repeat(argument_count){
		args[i] = argument[i];
		i++;
	}
	return new __wxObservable(method({
			args : args,
			size : argument_count, 
			done : 0
		}, function(_observer){
		observer = _observer;
		var i = 0;
		repeat(array_length(args)){
			
			args[i].subscribe(__wxObserver(
				
				function(_val){observer.next(_val);},
				function(_err){observer.error(_val);},
				function(){
					done++;
					if ( done == size ){
						observer.complete();	
					}
				}
				
			));
			
		i++;}
		return function(){};
	}), "wx_merge");
}