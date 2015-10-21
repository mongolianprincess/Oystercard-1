Answers to interview questions #02
==================================

Explain RSpec file and folders naming conventions.
--------------------------------------------------
`rspec` can be installed either by declaring `gem "rspec"` in the Gemfile, or running `gem install rspec`. Initial configuration can be done with `rspec --init`. This creates two config files `.rspec` and `spec/spec_helper.rb`. Specs are then created in the `spec` folder, which means they will be automatically run with the `rspec` command.

What do default options in RSpec configuration file mean?
---------------------------------------------------------
The default options in the `.rspec` file are:
```ruby
--color
--require spec_helper
```
The first option enables colour in the output, whilst the second automatically requires the `lib/spec_helper.rb` config file so it does not explicitly need to be required in files.

The default options in the `spec_helper.rb` file are:
```ruby
expectations.include_chain_clauses_in_custom_matcher_descriptions = true
```
which allows the result description to display the full chain of matchers used, and;
```ruby
mocks.verify_partial_doubles = true
```
which prevents you from mocking or stubbing a method that does not exist on a real object.


What do .. and . shortcuts in the command line mean?
----------------------------------------------------
`..` is shorthand for the parent directory and `.` is shorthand for the current directory.
