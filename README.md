### NAME ###

Test::More::Behaviour - BDD module for Perl

### INSTALL ###

```
$ cpan -i Test::More::Behaviour
```

### SYNOPSIS ###

``` perl
describe 'Bank Account' => sub {
  context 'transferring money' => sub {
    it 'withdrawals amount from the source account' => sub {
      my $source = BankAccount->new(100);
      my $target = BankAccount->new(0);
      $source->transfer(50, $target);
      is($source->balance, 50);
    };
    it 'deposits amount into target account' => sub {
      my $source = BankAccount->new(100);
      my $target = BankAccount->new(0);
      $source->transfer(50, $target);
      is($target->balance, 50);
    };
  };
};
```

### DESCRIPTION ###

Test::More::Behaviour is a Behaviour-Driven Development module for Perl
programmers.  It is modeled after Rspec [http://rspec.info](http://rspec.info) the infamous BDD tool for Ruby programmers.

Because Test::More::Behaviour uses Test::More as its 'base', you can treat every Test::More::Behaviour test as if it were Test::More!

### QUICK REFERENCE ###

This project is built with the philosophy that 'Tests are the Documentation'.  For a full set of features, please read through the test scenarios.

#### describe ####

Used to group a set of examples of a particular behaviour of the system that you wish you describe.

#### it ####

An example to run.

#### context ####

Used to further establish deeper relations for a set of examples.  This is best used when several examples have similar interactions with the system but have differring expectations.

#### before_all ####

#### before_each ####

#### after_each ####

#### after_all ####

Used to define code which executes before and after each example or only once per example group.

### SOURCE ###

The source code for Test::More::Behaviour can be found at [https://github.com/bostonaholic/test-more-behaviour](https://github.com/bostonaholic/test-more-behaviour)

### BUGS AND LIMITATIONS ###

Currently, each `it` will not run as a Test::More::subtest.  This is because the coloring was not working correctly because subtest needed the description before evaluating the block passed in.  If you can fix this, please submit a github pull request and I will take a look.

If you do find any bugs, please send me an email or send me a github pull request with a broken test (and your fix if you're able to) and I will be more than happy to fix.

### DEPENDENCIES ###

[Test::More](http://search.cpan.org/~mschwern/Test-Simple-0.98/lib/Test/More.pm)

[Term::ANSIColor](http://search.cpan.org/~rra/Term-ANSIColor-3.01/ANSIColor.pm)

[version](http://search.cpan.org/~jpeacock/version-0.93/lib/version.pod)

[IO::Capture::Stdout](http://search.cpan.org/~reynolds/IO-Capture-0.05/lib/IO/Capture/Stdout.pm) (test only)

### AUTHOR ###

Matthew Boston &lt;matthew DOT boston AT gmail DOT com&gt; with special thanks to Dustin Williams.

### COPYRIGHT ###

Copyright (c) 2011 Matthew Boston.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

### DISCLAIMER ###

I assume no responsibility if this documentation is incorrect or outdated.  The tests are fully documenting of this software.
