function __wxSubscription(obx) constructor {
	
	observable = obx;
	tracer = obx.tracer;
	teardowns = [];
	
	static add = function(td_func){
		array_push(teardowns, td_func);	
	}
	static unsubscribe = function(){
		///@func unsubscribe()
		
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