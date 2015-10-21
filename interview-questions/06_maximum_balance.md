Answers to interview questions #06
==================================
What are exceptions in Ruby? Why do they have messages associated with them?
----------------------------------------------------------------------------
Exceptions are classes of error types, they have messages associated to display certain information about why it was called, which can help you trace the error.

How can you check an expression raises an error with RSpec? Why do you have to pass the code as a block to do this?
-------------------------------------------------------------------------------------------------------------------
```ruby
expect{}.to raise_error "optional message"
```
If it's in the curly braces it will evaluate the block after reading all of the code, therefore not cutting out once encountering the error.

What are constants and how are they different from variables? Why use them?
---------------------------------------------------------------------------
A constant is immutable (although it can be changed, ruby will warn you) and is used as a constant value throughout the code. We use them as a reference point to something that will never change
ie. (my love for) pi

What does the DRY acronym mean? Why is it important to keep your code DRY?
--------------------------------------------------------------------------
*Don't rub yourself (2015 Nikesh)* <br>

It's easier to maintain, refactor, and find bugs in. 
