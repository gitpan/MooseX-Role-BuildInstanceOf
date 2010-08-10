
use strict;
use warnings;

BEGIN { require 5.008001; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Less Boilerplate when you need lots of Instances',
  'AUTHOR' => 'John Napiorkowski <jjnapiork@cpan.org>, Florian Ragwitz <rafl@debian.org>',
  'BUILD_REQUIRES' => {
    'Class::MOP' => '0',
    'List::MoreUtils' => '0',
    'List::Util' => '0',
    'Moose' => '0',
    'Moose::Role' => '0',
    'MooseX::Iterator' => '0',
    'MooseX::Types::Path::Class' => '0',
    'Perl6::Junction' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MooseX-Role-BuildInstanceOf',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MooseX::Role::BuildInstanceOf',
  'PREREQ_PM' => {
    'Class::MOP' => '0.94',
    'Moose' => '0.92',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::Role::Parameterized' => '0.13'
  },
  'VERSION' => '0.07',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



