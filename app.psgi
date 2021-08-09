#!/usr/env/bin perl

use strict;
use warnings;

use Mojolicious::Lite -signatures;

use lib 'lib';

use UrlShortner::BaseConverter;
use UrlShortner::DB;

get '/:shortlink' => sub ($c) {

    my $shortlink = $c->param('shortlink');

    my $url_id = UrlShortner::BaseConverter::convertToBaseTen($shortlink);

    my $dbh = UrlShortner::DB::connectToDb();

    my $url = UrlShortner::DB::getLink( $dbh, $url_id );

    $c->redirect_to("http://$url");
};

get '/' => sub ($c) {

    my $short_url;

    if ( $c->param('url') ) {
        my $dbh = UrlShortner::DB::connectToDb();

        my $id = UrlShortner::DB::insertLink( $dbh, $c->param('url') );

        $short_url = UrlShortner::BaseConverter::convertToBaseSixtyTwo($id);
    }

    $c->render( template => 'home', short_url => $short_url );
};

app->start;

__DATA__

@@ home.html.ep
<h1>URL Shortner</h1>
<form action="/">
    <label for="url">URL:</label><br>
    <input type="text" id="url" name="url" value="www.google.com"><br>
    <input type="submit" value="Submit">
</form>
<p>Short URL is: <%= $short_url %></p>
