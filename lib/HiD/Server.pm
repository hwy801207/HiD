package HiD::Server;
use strict;
use warnings;

use parent 'Plack::App::File';

sub locate_file {
  my ($self, $env) = @_;

  my $path = $env->{PATH_INFO} || '';

  $path =~ s|^/|| unless $path eq '/';

  if ( -e -d $path and $path !~ m|/$| ) {
    $path .= '/';
    $env->{PATH_INFO} .= '/';
  }

  $env->{PATH_INFO} .= 'index.html'
    if ( $path && $path =~ m|/$| );

  return $self->SUPER::locate_file( $env );
}

1;