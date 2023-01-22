// https://rxjs.dev/api/index/function/of
function wx_of(){	
	
	var i = 0;
	var args = [];
	repeat(argument_count){
		args[i] = argument[i];
		i++;
	}
	
	return new __wxObservable(method({args : args}, function(observer){
		var i = 0;
		repeat(array_length(args)){
			
			observer.next(args[i]);	
			
		i++;}
		observer.complete();
		return function(){};
	}), "wx_of");
}