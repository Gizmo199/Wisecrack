// https://rxjs.dev/api/operators/debounce
function wx_debounce(delay){
	return method({delay : delay, timer : undefined, done : false}, function(_source){
		source = _source;
		name = source.name;
		return new __wxObservable(function(_observer){
			observer = _observer;
			sub = source.subscribe(__wxObserver(
				function(_val){	
					
					if ( timer != undefined ) timer.destroy();	
					var this = self;
					timer = new __wxAlarm(delay, false, method({this : this, val : _val}, function(){
						this.observer.next(val);
						this.timer = undefined;
						if ( this.done ){
							this.observer.complete();	
						}
					}));
					
				}, 
				function(_err){ observer.error(_err); },
				function(){ 
					done = true;
					if ( timer == undefined ){
						observer.complete();
					}
				}
			));
			return function(){ sub.unsubscribe(); };
		}, "wx_debounce");
	});
}