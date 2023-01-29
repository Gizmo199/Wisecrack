function __wxEventCaller() constructor {
	
	callstack = [];
	static add = function(func){
		array_push(callstack, func);
	}
	static remove = function(func){
		var i = 0;
		repeat(array_length(callstack)){
			if ( callstack[i] == func ){
				array_delete(callstack, i, 1);
				break;
			}
			i++;
		}
	}
	static call = function(arg = undefined){
		if ( array_length(callstack) == 0 ) return;
		var i = 0;
		repeat(array_length(callstack)){
			var fn = callstack[i];
			if ( arg == undefined ) fn();
			else fn(arg);
			i++;
		}
	}
}