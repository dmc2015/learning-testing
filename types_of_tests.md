#TYPES OF TESTS
unit tests
- does a specific method/class/ perform the expected behavior

integration tests
- tests for models
- testing an aspect of the application that allows other features towork

end to end tests
- does the ui behave the way it is expected to


acceptance tests
- does the whole application work and all the aspects the lend to its functioning
- exercise code across many components, carrying out actions that the user completes

there should be more unit tests than integration and more integration tests than acceptance tests




#ALIASES
context alias => describe
example alias => it

#HOOKS
hook types
before
after
around

hooks can make tests confusing


#MATCHERS
to eq
not_to eq
to_to eq
to be !=
to be ==
to be <
to be >
to be >=
to be <=
match (for strings)
start_with (for strings)
be_truthy
be_falsey
respond_to (supports a method)

#COLLECTON MATCHERS
include
to all
to all(have_attributes
