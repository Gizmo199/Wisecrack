function __wxTimesource(time, func=function(){}, scheduler=WX_SCHEDULER) constructor {
	
	count = 0;
	total = time;
	id = time_source_create(scheduler, 1, WX_UNITS, function(){
		
		call();
		if ( count >= total && total != -1 ) destroy();
		count++;
		
	}, [], time);
	
	call = func;
	destroy = function(){
		time_source_destroy(id);	
	}
	time_source_start(id);
	
}