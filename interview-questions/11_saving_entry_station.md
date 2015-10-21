Interview questions you may expect:

----

## What is the nil value in Ruby? How can you check a variable is nil? What happens if nil is used in a conditional expression (if/unless)? ##

Nil is an singleton object of the Nil class, nil also has a boolean value of false. To check is a variable is nil you can use:
```
2.2.3 :001 > object = nil
 => nil
2.2.3 :002 > object.nil?
 => true
```
Nill when used in a conditional expression, will evaluate to false unless compared to something that returns nil

---

## Why would you want to temporarily disable some tests (make them pending)? ##

So that the test sequence can progress past selected tests, so that you can determine if the test or the code has a bug, and therefore can fix it.
