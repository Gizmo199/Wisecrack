function __wxInit(){
	
	WX_TIME			= 0;
	WX_SCHEDULER	= time_source_create(
				time_source_game, WX_PERIOD, WX_UNITS, 
				function(){ 
					if ( !instance_exists(__wxGlobal) ){
						instance_create_depth(0,0,0,__wxGlobal);	
					}
					WX_TIME++; 
					}, [], -1);
				
	time_source_start(WX_SCHEDULER);
	
}
