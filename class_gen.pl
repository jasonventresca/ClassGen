#!/usr/bin/perl
# class_gen.pl
# A simple C++ class implementation/header file generator

use strict;
use warnings;

my $template_header_path = "~/dev/ClassGen++/tensor.h";
my $template_implementation_path = "~/dev/ClassGen++/tensor.h";
my $output_header_path;
my $output_implementation_path;
my $class_name;
my $namespace;

# ask user for name of class and namespace
print "Class name (e.g. Tensor): ";
$class_name = <>;
chomp($class_name);

print "Namespace (e.g. Math): ";
$namespace = <>;
chomp($namespace);

# open template files
open TEMPLATE_HEADER_FILE, $template_header_path
  or die "Could not open template file: " . $template_header_path;

open TEMPLATE_IMPLEMENTATION_FILE, $template_implementation_path
  or die "Could not open template file: " . $template_implementation_path;

# open output files
open OUTPUT_HEADER_FILE, "> " + $output_header_path
  or die "Could not open output file: " . $output_header_path;

open OUTPUT_IMPLEMENTATION_FILE, "> " + $output_implementation_path
  or die "Could not open output file: " . $output_implementation_path;
