# Linq

Language-Integrated Query (LINQ) is a set of features introduced in Visual Studio 2008 (That moment for #C, VisualBasic) that extends powerful query capabilities to the language syntax. This gem is wrapper for linq.js JavaScript plugin. LINQ introduces standard, easily-learned patterns for querying and updating data, and the technology can be extended to support potentially any kind of data store.

## Features

- Implement all .NET 4.0 methods and many extra methods (inspiration from Rx, Achiral, Haskell, Ruby, etc...)
- Complete lazy evaluation
- Two versions - linq.js and jquery.linq.js (jQuery plugin)
- Binding for Reactive Extensions for JavaScript(RxJS)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linq'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install linq

Add to javascript manifest `application.js`
    
	//= require linq

## Examples of usage
```javascript
var jsonArray = [
    { "user": { "id": 100, "screen_name": "d_linq" }, "text": "to objects" },
    { "user": { "id": 130, "screen_name": "c_bill" }, "text": "g" },
    { "user": { "id": 155, "screen_name": "b_mskk" }, "text": "kabushiki kaisha" },
    { "user": { "id": 301, "screen_name": "a_xbox" }, "text": "halo reach" }
]

var queryResult = Enumerable.From(jsonArray)
    .Where(function (x) { return x.user.id < 200 })
    .OrderBy(function (x) { return x.user.screen_name })
    .Select(function (x) { return x.user.screen_name + ':' + x.text })
    .ToArray();
    
// shortcut! string lambda selector
var queryResult2 = Enumerable.From(jsonArray)
    .Where("$.user.id < 200")
    .OrderBy("$.user.screen_name")
    .Select("$.user.screen_name + ':' + $.text")
    .ToArray();
```    

And more tricky:

```javascript	  
// anonymous function
Enumerable.Range(1, 10)
    .Where(function(i) { return i % 3 == 0; })
    .Select(function(i) { return i * 10; });
    
// lambda expression
Enumerable.Range(1, 10).Where("i => i % 3 == 0").Select("i => i * 10");

// $ is default iterator variable like Scala's "_" or Groovy's "it"
Enumerable.Range(1, 10).Where("$ % 3 == 0").Select("$ * 10");

 // "" is shorthand of "x => x" (identity function)
Enumerable.Range(4, 7).Join(Enumerable.Range(8, 5), "", "", "outer,inner=>outer*inner");

// Enumerable.From is wrap from primitive array, string(to charArray), object(to KeyValuePair[]) etc..
var array = [100, 200, 30, 40, 500, 40, 200];
var ex1 = Enumerable.From(array).Distinct().ToArray(); // [100, 200, 30, 40, 500]
var ex2 = Enumerable.From("foobar").ToArray(); // ["f", "o", "o", "b", "a", "r"];
var ex3 = Enumerable.From({foo:10, bar:20}).ToArray(); // [{Key:"foo",Value:10}, {Key:"bar",Value:20}]

// object literal
Enumerable.From(array).Select("val,i=>{Value:val, Index:i}")
```

Full [documentation is on the wiki][wiki]

[wiki]: https://github.com/khusnetdinov/linq/wiki
