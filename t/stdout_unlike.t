use Test::More tests => 18;
use Test::Tester;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stdout_unlike(sub {
                        print "TEST OUT\n";
                      },
                      qr/OUT/i,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => '',
              diag => "STDOUT:\nTEST OUT\n\nmatches:\n(?i-xsm:OUT)\nnot expected\n",
            },'STDOUT matching success'
          );

check_test( sub {
            stdout_unlike(sub {
                        print "TEST OUT\n";
                      },
                      'OUT',
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'stdout_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'bad regex'
          );

check_test( sub {
            stdout_unlike(sub {
                        print "TEST OUT\n";
                      },
                      qr/OUT/,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT:\nTEST OUT\n\nmatches:\n(?-xism:OUT)\nnot expected\n",
            },'STDOUT not matching failure'
          );
