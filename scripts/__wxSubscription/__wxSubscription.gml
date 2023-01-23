function __wxSubscription(obx) constructor {
	
	observable = obx;
	subscriber = undefined;
	tracer = obx.tracer;
	teardowns = [];
	
	static add = function(td_func){
		array_push(teardowns, td_func);	
	}
	static clear = function(){
		teardowns = [];	
	}
	static unsubscribe = function(){
		///@func unsubscribe()
		
		if ( subscriber != undefined ){
			observable.remove(subscriber);	
		}
		
		var i = 0;
		if ( tracer.enabled && WX_VERBOSE ) tracer.teardown();
		repeat(array_length(teardowns)){
			var fn = teardowns[i];
			if ( is_method(fn) ){ 
				return fn(); 
			}
			if ( is_struct(fn) ) {
				if ( fn[$ "teardowns"] != undefined ) {
					fn.unsubscribe();	
				}
			}	
			i++;
		}
		teardowns = [];
	}	
}