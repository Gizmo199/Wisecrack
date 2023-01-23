// https://rxjs.dev/api/index/function/generate
function wx_generate(intial_value, condition_func, iteration_func){	
	
	return new __wxObservable(method({
		ival : intial_value,
		cond : condition_func,
		iter : iteration_func
		}, function(_observer){
		observer = _observer;
		runloop = function(){
			if ( cond(ival) ){
				ival = iter(ival);
				observer.next(ival);
				runloop();
			} else {
				observer.complete();	
			}
		}
		runloop();

		
		return function(){};
	}), "wx_of");
}