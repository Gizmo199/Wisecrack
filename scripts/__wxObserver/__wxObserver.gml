function __wxObserver(_next=function(){}, _error=function(){}, _complete=function(){}){
	return {
		next		: _next,
		error		: _error,
		complete	: _complete
	}
}