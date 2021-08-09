package UrlShortner::DB;

use strict;
use warnings;

use DBI;

sub connectToDb {

    return DBI->connect( "DBI:mysql:database=urlshortner;host=127.0.0.1",
        $ENV{'DBUSER'}, $ENV{'DBPASSWORD'}, { 'RaiseError' => 1 } );
}

sub insertLink {
    my $dbh = shift;
    my $url = shift;

    my $sql = 'INSERT INTO link SET url = ?';
    my $sth = $dbh->prepare($sql);
    $sth->execute($url);

    my $id = $sth->{'mysql_insertid'};

    return $id;
}

sub getLink {
    my $dbh    = shift;
    my $url_id = shift;

    my $sql = 'SELECT url FROM link WHERE id = ?';
    my $sth = $dbh->prepare($sql);
    $sth->execute($url_id);

    my ($url) = $sth->fetchrow_array();

    return $url;
}

1;
