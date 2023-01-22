#macro WX_SCHEDULER		global.__wxScheduler		// Wisecrack parent scheduler
#macro WX_TIME			global.__wxCurrentTime		// Wisecrack current_time
#macro WX_UNITS			time_source_units_frames	// What unit type we use for Wisecrack schedulers 
#macro WX_PERIOD		1							// How often we update scehdulers in Wisecrack
#macro WX_VERBOSE		true						// Enables debug messages for the static operators ".trace()" method

// Other initializations
__wxInitClock();									