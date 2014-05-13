## [Practical Object-Oriented Design in Ruby](http://www.poodr.com/)
### by Sandi Metz

Here are my notes for each chapter of Sandi Metz's fantastic bible of good object-oriented design, which applies to ALL object-oriented languages and will be true for your whole software career. See my Markdown files (.md) for a summary of each chapter.

I rewrote all her Minitest software tests in RSpec.

  - [Sandi's Minitest files](https://github.com/rayning0/poodr/tree/master/test)
  - [My RSpec versions of Sandi's files](https://github.com/rayning0/poodr/tree/master/spec)

Sandi's [final versions of all her book code](https://github.com/rayning0/poodr/tree/master/lib) are in /lib.

### To run all tests

In top level directory, to run all Minitest tests, type:
```
rake
```
To run all RSpec tests, type
```
rspec
```
2 of the tests will fail if you run them in bulk this way. However, if you test that 1 file directly, these 2 tests pass:
```
ruby test/ch9d_test.rb (Minitest)
rspec spec/ch9d_spec.rb (RSpec)
```
These 2 tests are for a mock "observer" object, to see if Gear actually sends it a message to :change. For some reason, the group rake and rspec way of running tests cannot deal with this mock object, thinking "observer" is nil.

However, testing just that 1 file works. If you have questions/comments, please say hi:

  - Raymond Gan
  - rayning@gmail.com
  - http://twitter.com/rgan0
