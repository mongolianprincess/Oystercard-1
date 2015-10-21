Answers to interview questions #04
==================================
What file name conventions Ruby classes use? What happens if the class name is in CamelCase?
--------------------------------------------------------------------------------------------
The convention is for class names to be written in CamelCase. Ruby will raise a syntax error if the first letter of a class name is not capitalised. The file name convention is to name a class' file classname.rb, all lowercase.

Explain what test-driven development is and what its advantages are.
--------------------------------------------------------------------
TDD means the tests drive development - tests are written before the code they are testing. Advantages: ensures you write the MVP and makes it easier and simpler to maximise test coverage. Also reduces time in rework and debugging, allows the design to evolve and change with your understanding of the problem.

Describe the structure of a unit test.
--------------------------------------
A unit test typically tests a single class in isolation. The structure consists of four steps: setup, exercise, verify and teardown. The exercise step involves running the source code, whilst the verify stage evaluates the expectations based on the result of running that code.

Discuss good and bad examples of test descriptions
--------------------------------------------------
Shouldn't be vague, should describe what is being tested in a concise manner.

What are Ruby symbols? How are they different from strings? What are their advantages?
--------------------------------------------------------------------------------------
Ruby symbols are *things* that has both a number and a string representation.
They are different from strings as they are *immutable*, as shown below:
```ruby
"string".object_id == "string".object_id # => false
:string.object_id == :string.object_id # => true
```
Strings are also different as they have a lot more methods for manipulation.

The advantages to using symbols instead of strings are: in cases where you would be using the same string literal over and over again, using a symbol instead will save memory as there is only ever one instance of the symbol held in memory. Two symbols of the same name actually map to the same object in memory, whereas two strings with the same characters create different objects. Symbols are immutable and lightweight, which makes them ideal for elements that you won't be changing around at runtime; keys in a hash table, for example.

What is a Ruby class? What is an instance of a class?
-----------------------------------------------------
A Ruby class is a collection of methods which can be called on an instance of that class, and associated variables. It is a blueprint from which individual objects are created. An instance of a class is the specific object created according to the blueprint.

What's a class constructor? What is the initialize method? How are they different?
----------------------------------------------------------------------------------
A class constructor is a subroutine called to create an object. It prepares the new object for use. The initialize method in Ruby is called by the constructor as part of creating the object.
