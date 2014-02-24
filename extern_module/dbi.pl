#!/usr/bin/perl
use strict;
use DBI;

my $dsn      = "DBI:mysql:p2pdn_development:127.0.0.1:3306";
my $user     = "root";
my $password = "";
my @row      = undef;
my $dbh = DBI->connect($dsn, $user, $password, 
    { RaiseError => 1, AutoCommit => 0});

my $sth = $dbh->prepare("SELECT * FROM whitelists");
$sth->execute();

while (@row = $sth->fetchrow_array) {
  print "@row\n";
}

my $rc = $dbh->disconnect;
