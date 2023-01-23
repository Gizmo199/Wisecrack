![LOGO](https://user-images.githubusercontent.com/25496262/214130065-2415c270-90f6-4bb5-95c4-3b8eee20a5d6.png)

## About
Inspired by reactive libraries such as [RxJS](https://github.com/ReactiveX/rxjs) and [Angular](https://github.com/angular), Wisecrack is a powerful library of functions and operators aimed to help make your life easier when dealing with asyncrenous and general data management.

## Features
- Configurations for schedulers (timesources), global event names, and verbose
- Event handlers and event firing (including a global event handler `WX_GLOBAL`)
- Examples for every operator and functions
- `Observers`, `Observables`, and `Subjects`

## Operators
these operators follow the naming conventions of standard reactive libraries, with `wx_*` added before each operator. You can enable short hands in the `__wxStenograph` script which allows for CamelCased shorthand operator names. 

- Static operators (more to come)
  - of
  - from
  - generate
  - timer
  - interval
  - merge
  - fromEvent
  
- Pipeable operators (more to come)
  - tap
  - map
  - first
  - last
  - take
  - pluck
  - filter
  - scan
  - reduce
  - delay
  - throttle
  - debounce
  - switchmap
  - mergemap
  - concatmap
  - takeuntil
  - takewhile

## Debugging
You can implement debug logs for observable streams using `.trace(OPTIONAL NAME)` after a **static operator**, **observables**, or **subjects** like so:

**obj_trace_example > Create event**
```
var my_observable_stream = wx_of(1, 2, 3).trace("1, 2, 3 stream");  // Trace our stream

my_observable_stream.subscribe(function(v){                         // Subscribe a function to it
    show_debug_message("The data was: "+string(v));
});
```

will produce this in the **Output** log:
```
Wisecrack:		[ obj_trace_example ] piped [ 1, 2, 3 stream ]
Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 1
The data was: 1
Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 2
The data was: 2
Wisecrack:		from [ obj_trace_example ] -> 1, 2, 3 stream emitted: 3
The data was: 3
Wisecrack:		completed [ obj_trace_example ]
Wisecrack:		teardown  [ 1, 2, 3 stream ]
```

This is good for following the the pipeline of an observable. You can **ALL** tracing off by setting `WX_VERBOSE` to false in `__wxConfig`
