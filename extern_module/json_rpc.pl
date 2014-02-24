#!/usr/bin/perl
# error 
use strict;
use JSON::RPC::Client;

my $client = new JSON::RPC::Client;
my $uri = 'http://www.example.com/jsonrpc/API';

my $callobj = {
    method => 'sum',
    params => [17, 25],
};

my $res = $client->call($uri, $callobj);

if ($res) {
    if ($res->is_error) {
        print "Error:", $res->error_message;
    } else {
        print $res->result;
    }
} else {
    print $client->status_line;
}
