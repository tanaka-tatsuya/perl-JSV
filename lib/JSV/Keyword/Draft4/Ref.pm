package JSV::Keyword::Draft4::Ref;

use strict;
use warnings;
use parent qw(JSV::Keyword);

use JSV::Keyword qw(:constants);

sub instance_type() { INSTANCE_TYPE_ANY(); }
sub keyword() { '$ref' }
sub keyword_priority() { 5; }

sub validate {
    my ($class, $context, $schema, $instance) = @_;

    eval {
        $context->reference->resolve(
            $schema,
            +{
                base_uri => $context->original_schema->{id},
                root     => $context->original_schema
            }
        );
    };
    if ( my $e = $@ ) {
        $context->log_error(sprintf("Failed to resolve reference: %s", $e));
    }
}

1;
