function __wxSubject(_name="subject") constructor {
	
	// Main
	subscribers		= [];

	// Tracing
	name		= _name;
	trace_pipe	= false;
	tracer		= __wxTrace(_name, other);
	
	static __struct_merge = function(struct1, struct2){
		var names = variable_struct_get_names(struct2);
		var i = 0;
		repeat(array_length(names)){
			struct1[$ names[i]] = struct2[$ names[i]];
			i++;
		}
	}
	static subscribe = function(_next=function(){}, _error=function(){}, _complete=function(){}){
		
		var observer = __wxObserver(_next, _error, _complete);
		if ( typeof(_next) == "struct" ) __struct_merge(observer, _next);
		
		var subscription = new __wxSubscription(self);
		var subscriber = new __wxSubscriber(self, observer, subscription);
		subscription.subscriber = subscriber;
		array_push(subscribers, subscriber);
		
		return subscription;
	}
	static next = function(data){
		var i = 0;
		repeat(array_length(subscribers)){
			subscribers[i].next(data);			
			i++;
		}
	}
	static error = function(data){
		var i = 0;
		repeat(array_length(subscribers)){
			subscribers[i].error(data);			
			i++;
		}
	}	
	static complete = function(){
		var i = 0;
		repeat(array_length(subscribers)){
			subscribers[i].complete();		
			i++;
		}
	}	
	static remove = function(subscriber_id){
		var i = 0;
		repeat(array_length(subscribers)){
			if ( subscribers[i] == subscriber_id ){
				array_delete(subscribers, i, 1);
				break;
			}
			i++;
		}
	}
	static pipe = function(){
		
		var i = 0;
		var args = [];
		repeat(argument_count){
			array_push(args, argument[i]);	
			i++;
		}
		return __wxPipe(args, trace_pipe)(self);
	}
	static trace = function(root_name){
		
		if ( root_name != undefined ){
			name = root_name;
			tracer = __wxTrace(name, other);
		}
		tracer.enabled = true;
		if ( WX_VERBOSE ){ tracer.start(); }
		trace_pipe = true;
		return self;
	}
}