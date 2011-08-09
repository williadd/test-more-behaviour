package Test::More::Behaviour;

use 5.010000;
use strict;
use warnings;

use base 'Test::More';
use Test::More;

use version; our $VERSION = qv('0.3.2');

our @EXPORT = ( @Test::More::EXPORT, qw(describe context it) );

my $spec_desc;
my $context_desc;

sub describe {
  $spec_desc = shift;
  my $block  = shift;
  _evaluate_and_print($spec_desc, $block);
  $spec_desc = undef;

  return;
}

sub context {
  $context_desc = shift;
  my $block     = shift;
  _evaluate_and_print($context_desc, $block);
  $context_desc = undef;

  return;
}

sub it {
  my $description = shift;
  my $block       = shift;

  caller->set_up if caller->can('set_up');
  _evaluate_and_print_subtest($description, $block);
  caller->tear_down if caller->can('tear_down');

  return;
}

sub _evaluate_and_print {
  my $desc  = shift;
  my $block = shift;
  $block->();
  $desc     = undef;
  return;
}

sub _evaluate_and_print_subtest {
  my $description = shift;
  my $block       = shift;

  return subtest _construct_description($description) => sub {
    plan 'no_plan';
    eval {
      $block->();
      1;
    } or do {
      fail($@);
    };
  };
}

sub _construct_description {
  my $result = shift;

  $result = "$spec_desc\n\t $result" if $spec_desc and (! $context_desc);
  $result = "$spec_desc\n\t $context_desc\n\t   $result" if $spec_desc and $context_desc;
  return $result;
}

1;
