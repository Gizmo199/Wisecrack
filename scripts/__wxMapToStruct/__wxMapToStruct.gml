function __wxMapToStruct(ds_map){
	var names = ds_map_keys_to_array(ds_map);
	var struct= {};
	var i = 0;
	repeat(array_length(names)){
		struct[$ names[i]] = ds_map[? names[i]];	
		i++;
	}
	return struct;
}