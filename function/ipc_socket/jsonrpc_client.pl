#!/usr/bin/perl
# Description: net client 

use IO::Socket::INET;
use strict;
use JSON;

my $remote_host = "127.0.0.1";
my $remote_port = 12121;
my $socket = IO::Socket::INET->new(PeerAddr => $remote_host,
                                PeerPort => $remote_port,
                                Proto    => "tcp",
                                Type     => SOCK_STREAM)
    or die "Could't connect to $remote_host:$remote_port:$!\n";

my $json = JSON->new;
%rpc = (
    'jsonrpc' => '2.0',
    'id' => 'test',
    'method' => 'ls',
    'params' => ['-l', '~']
);
my $msg = $json->encode(\%rpc)
print $socket $msg;

my $answer = <$socket>; # read remote response
print 'jsonrpc: ', $answer{'jsonrpc'};
close($socket);
