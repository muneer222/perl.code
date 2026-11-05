#!/usr/bin/perl
use lib '.';
use warnings;


my $config;
my $config_file = 'config.pl';

# Execute the file
unless ($config = do $config_file) {
    if ($!) {
        die "Error: Could not read configuration file '$config_file': $!\n";
    }
    elsif ($@) {
        die "Error: Configuration file '$config_file' failed to compile: $@\n";
    }
    elsif (!defined $config) {
        die "Error: Could not run configuration file '$config_file'\n";
    }
}

# Load the file directly into a scoped scalar variable
# $config = do "config.pl" or die "Could not parse config.pl: $@" if $@;
die "Could not read config.pl $!" unless defined $config;

# Access your configuration variables
print "Connecting to: " . $config->{database} . "\n";
print "First feature: " . $config->{features}[0] . "\n";


$f = $config->{features};
for ($i = 0; $i <= $#$f ; $i++) {
        print $f->[$i] . "\n";
}

print "------------------------\n";
for ($i = 0; $i <= $#{$config->{features}}; $i++) {
        print $config->{features}->[$i] . "\n";

}

print "*****************************\n";

foreach my $key (keys %{ $config->{user} }) {
        my $value = $config->{user}{$key};
        print "$key: $value\n";
}
