function __wxInitClock(){
	WX_TIME			= 0;
	WX_SCHEDULER	= time_source_create(
				time_source_game, WX_PERIOD, WX_UNITS, 
				function(){ 
					WX_TIME++; 
					}, [], -1);
				
	time_source_start(WX_SCHEDULER);
}
