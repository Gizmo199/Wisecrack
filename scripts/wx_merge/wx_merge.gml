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
			
			var this = self;
			args[i].subscribe(__wxObserver(
				
				method({observer: observer}, function(_val){observer.next(_val);}),
				method({observer: observer}, function(_err){observer.error(_val);}),
				method({observer: observer, this: this}, function(){
					this.done++;
					if ( this.done == this.size ){
						observer.complete();	
					}
				})
				
			));
			
		i++;}
		return function(){};
	}), "wx_merge");
}