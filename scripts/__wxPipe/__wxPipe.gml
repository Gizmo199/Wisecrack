function __wxPipe(args, trace_enable=false){	
	return method({args: args, trace_enable: trace_enable}, function(_val){
		var acc = _val;
		for ( var i=0; i<array_length(args); i++ ){
			var fn = args[i];
			acc = fn(acc);
			if ( trace_enable ) acc.trace();
		}
		return acc;
	});
}