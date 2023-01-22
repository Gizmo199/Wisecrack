function __wxTrace(func, inst=undefined){
	var name = "unknown";
	switch(instanceof(inst)){
		case "instance" : name = object_get_name(inst.object_index); break;
		case "struct"	: 
			name = inst[$ "name"] != undefined ? inst.name : instanceof(inst); 
		break;
	}
	var f = is_string(func) ? func : script_get_name(func);
	return {
		enabled		: false,
		output		: undefined,
		ofname		: name,
		toname		: f,
		start		: function(){ show_debug_message("Wisecrack:		[ " + ofname + " ] piped [ " + toname + " ]"); },
		next		: function(value="", obx=undefined){ 
			var emitted = ( typeof(value) == "struct" ? value.name : value );
			if ( emitted == "observable" ){
				value.subscribe(__wxObserver(function(d){ output = d; }));
				emitted = string(output);
			}
			show_debug_message("Wisecrack:		from [ " + ofname + " ] -> " + toname + " emitted: " + string(emitted)); 
			
			output = undefined;
		},
		complete	: function(){ show_debug_message("Wisecrack:		completed [ " +ofname+ " ]"); },
		teardown	: function(){ show_debug_message("Wisecrack:		teardown  [ " +toname+ " ]"); }	
	}
}