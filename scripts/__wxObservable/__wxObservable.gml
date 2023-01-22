function __wxObservable(init_func, _name="observable") constructor {
	
	// Main
	func = init_func;
	
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
		///@func subscribe(next_or_observer [OPTIONAL], error [OPTIONAL], complete [OPTIONAL])	
		
		var observer = __wxObserver(_next, _error, _complete);
		if ( typeof(_next) == "struct" ) __struct_merge(observer, _next);
		
		var subscription = new __wxSubscription(self);
		var subscriber = new __wxSubscriber(self, observer, subscription);
		subscription.add(func(subscriber));
		
		return subscription;
	}
	static pipe = function(){
		///@func pipe(...operators [OPTIONAL])
		
		var i = 0;
		var args = [];
		repeat(argument_count){
			array_push(args, argument[i]);	
			i++;
		}
		return __wxPipe(args, trace_pipe)(self);
	}
	static trace = function(root_name){
		///@func trace(observable_name [OPTIONAL])
		
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