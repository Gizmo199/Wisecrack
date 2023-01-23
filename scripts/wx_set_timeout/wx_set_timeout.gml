function wx_set_timeout(time, func){
	return new __wxAlarm(time, false, func);
}