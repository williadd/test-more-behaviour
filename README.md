## PerlSpec ##

Just add PerlSpec to your project and `use`.

    use PerlSpec 'no_plan';

    describe 'PerlSpec' => sub {
      it 'makes testing Perl awesome!' => sub {
        ok($testing_perl eq 'awesome', '');
      };
    };

