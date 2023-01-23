#macro WX_GLOBAL		"Global"					// Wisecrack global event emitter
#macro WX_LISTENERS		global.__wxEventListeners	// Wisecrack event listeners
#macro WX_SCHEDULER		global.__wxScheduler		// Wisecrack parent scheduler
#macro WX_TIME			global.__wxCurrentTime		// Wisecrack current_time
#macro WX_UNITS			time_source_units_frames	// What unit type we use for Wisecrack schedulers 
#macro WX_PERIOD		1							// How often we update scehdulers in Wisecrack
#macro WX_VERBOSE		true						// Enables debug messages for the static operators ".trace()" method

// Other initializations
__wxInit();		

// Global events
WX_LISTENERS = {};
WX_LISTENERS[$ WX_GLOBAL] = {
	
	// One shot
	cleanup					: new __wxEventCaller(),
	mouse_press				: new __wxEventCaller(),
	mouse_release			: new __wxEventCaller(),
	mouse_wheelup			: new __wxEventCaller(),
	mouse_wheeldown			: new __wxEventCaller(),
	keypress				: new __wxEventCaller(),
	keyrelease				: new __wxEventCaller(),
	room_start				: new __wxEventCaller(),
	room_end				: new __wxEventCaller(),
	
	// Async
	broadcast				: new __wxEventCaller(),
	async_save_load			: new __wxEventCaller(),
	async_image_load		: new __wxEventCaller(),
	async_audio_playback	: new __wxEventCaller(),
	async_audio_record		: new __wxEventCaller(),
	async_dialog			: new __wxEventCaller(),
	async_notification		: new __wxEventCaller(),
	async_social			: new __wxEventCaller(),
	async_system			: new __wxEventCaller(),
	async_cloud				: new __wxEventCaller(),
	async_iap				: new __wxEventCaller(),
	async_networking		: new __wxEventCaller(),
	async_steam				: new __wxEventCaller(),
	async_web				: new __wxEventCaller()

}