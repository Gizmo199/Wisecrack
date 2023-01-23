![LOGO](https://user-images.githubusercontent.com/25496262/214130065-2415c270-90f6-4bb5-95c4-3b8eee20a5d6.png)

## About
Inspired by reactive libraries such as [RxJS](https://github.com/ReactiveX/rxjs) and [Angular](https://github.com/angular), Wisecrack is a powerful library of functions and operators aimed to help make your life easier when dealing with asynchronous and general data management.

## Features
- Configurations for schedulers (timesources), global event names, and verbose
- Event handlers and event firing (including a global event handler `WX_GLOBAL`)
- Examples for every operator and functions
- `Observers`, `Observables`, and `Subjects`

## Operators
Operators in Wisecrack follow the same naming conventions of standard reactive libraries, with `wx_*` added before each operator. You can enable short hands in the `__wxStenograph` script which allows for CamelCased shorthand operator names. 

- Static operators (more to come)
  - [of](https://rxjs.dev/api/index/function/of)
  - [from](https://rxjs.dev/api/index/function/from)
  - [generate](https://rxjs.dev/api/index/function/generate)
  - [timer](https://rxjs.dev/api/index/function/timer)
  - [interval](https://rxjs.dev/api/index/function/interval)
  - [merge](https://rxjs.dev/api/index/function/merge)
  - [fromEvent](https://rxjs.dev/api/index/function/fromEvent)
  
- Pipeable operators (more to come)
  - [tap](https://rxjs.dev/api/operators/tap)
  - [map](https://rxjs.dev/api/operators/map)
  - [first](https://rxjs.dev/api/operators/first)
  - [last](https://rxjs.dev/api/operators/last)
  - [take](https://rxjs.dev/api/operators/take)
  - [pluck](https://rxjs.dev/api/operators/pluck)
  - [filter](https://rxjs.dev/api/operators/filter)
  - [scan](https://rxjs.dev/api/operators/scan)
  - [reduce](https://rxjs.dev/api/operators/reduce)
  - [delay](https://rxjs.dev/api/operators/delay)
  - [throttle](https://rxjs.dev/api/operators/throttle)
  - [debounce](https://rxjs.dev/api/operators/debounce)
  - [switchmap](https://rxjs.dev/api/operators/switchMap)
  - [mergemap](https://rxjs.dev/api/operators/mergeMap)
  - [concatmap](https://rxjs.dev/api/operators/concatMap)
  - [takeuntil](https://rxjs.dev/api/operators/takeUntil)
  - [takewhile](https://rxjs.dev/api/operators/takeWhile)

## Debugging
You can implement debug logs for observable streams using `.trace(OPTIONAL NAME)` after **static operators**, **observables**, or **subjects** like so:

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

This is good for following the the pipeline of an observable. You can turn **ALL** tracing off by setting `WX_VERBOSE` to false in `__wxConfig`
