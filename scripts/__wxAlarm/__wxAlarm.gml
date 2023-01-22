function __wxAlarm(time, reset=false, func, scheduler=WX_SCHEDULER) constructor {
	
	id = time_source_create(scheduler, time, WX_UNITS, function(){
				
		call();
		if ( !kill ) destroy();
		
	}, [], -1);
	
	kill = reset;
	call = func;
	destroy = function(){
		if ( !time_source_exists(id) ) return;
		time_source_destroy(id);	
	}
	time_source_start(id);
	
}