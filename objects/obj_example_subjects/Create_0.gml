/*	wx_subject(name [OPTIONAL])
	
	A subject effectively functions as both an observable
	and an observer. You can push data to a subject using the 
	
		.next() 
		.error()
		.complete() 
		
	functions, as well as subscribing to them using 
	
		.subscribe()
		
	like you would a normal observable.
	
*/

subject = wx_subject();
subsub = undefined;

subject.subscribe(show_debug_message);
subject.subscribe(function(v){
	
	// show a message
	show_debug_message("Multiplied by: "+string(v * 2));
	
	// Keep track of sub-subscribers and unsubscribe them
	if ( subsub != undefined ) subsub.unsubscribe();
	subsub = subject.subscribe(function(v){
		show_debug_message("Sub-subscriber on: ("+string(v)+")");	
	})
	
	if ( v == 10 ) subsub.unsubscribe();
})

// Iterate
wx_interval(15).pipe(
	wx_takewhile(function(v){
		return v < 10;	
	})
).subscribe(function(v){
	subject.next(v);
});