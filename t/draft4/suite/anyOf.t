use strict;
use warnings;

use Test::More;
use Test::JSV::Suite;
use JSV::Validator;

subtest "strict mode" => sub {
    my $validator = JSV::Validator->new;
    Test::JSV::Suite->run(
        version => "draft4",
        suite   => "anyOf",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance);
        },
    );
};

subtest "loose mode" => sub {
    plan skip_all => "Test cases is not suitable with loose mode";

    my $validator = JSV::Validator->new;
    Test::JSV::Suite->run(
        version => "draft4",
        suite   => "anyOf",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance, +{ loose_type => 1 });
        },
    );
};

done_testing;
