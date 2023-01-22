function __wxSubscriber(obx, obs, sub) constructor {
	observer = obs;	
	observable = obx;
	subscription = sub;
	tracer = obx.tracer;
	
	finished = false;
	static next = function(val){
		if ( !finished ){
			if ( tracer.enabled && WX_VERBOSE ) tracer.next(val, observable);
			observer.next(val);	
		}
	}
	static error = function(err){
		if ( !finished ){
			finished = true;
			if ( tracer.enabled && WX_VERBOSE ) tracer.next(err, observable);
			observer.error(err);
			subscription.unsubscribe();
		}
	}
	static complete = function(){
		if ( !finished ){
			finished = true;
			if ( tracer.enabled && WX_VERBOSE ) tracer.complete();
			observer.complete();
			subscription.unsubscribe();
		}
	}
}