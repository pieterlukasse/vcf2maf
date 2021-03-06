#!/usr/bin/env perl

use strict;
use warnings;

# Find and chdir into the parent folder containing the scripts to test
use File::Basename 'dirname';
use Cwd 'abs_path';
my $test_dir = dirname( abs_path( __FILE__ ));
my $script_dir = dirname( $test_dir );
chdir $script_dir;

# Set the number of tests we'll run, and run them
use Test::Simple tests => 3;
ok( system( "perl vcf2maf.pl --help > /dev/null" ) == 0 );
ok( system( "perl vcf2maf.pl --man > /dev/null" ) == 0 );
ok( system( "perl vcf2maf.pl --input-vcf tests/test.vcf --output-maf tests/test_output.vep_isoforms.maf" ) == 0 );
ok( system( "perl vcf2maf.pl --input-vcf tests/test.vcf --output-maf tests/test_output.custom_isoforms.maf --custom-enst data/isoform_overrides_at_mskcc" ) == 0 );
