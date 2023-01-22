// https://rxjs.dev/api/index/function/from
function wx_from(array){	
	return new __wxObservable(method({array : is_array(array) ? array : [array]}, function(observer){
		var i = 0;
		repeat(array_length(array)){
			
			observer.next(array[i]);	
			
		i++;}
		observer.complete();
		return function(){};
	}), "wx_from");
}