#!/usr/bin/perl
# class_gen.pl
# A simple C++ class implementation/header file generator

use strict;
use warnings;

use constant
{
  HEADER_FILE_TYPE          =>  0,
  IMPLEMENTATION_FILE_TYPE  =>  1,
};

# configuration
my $template_namespace                = "Math";
my $template_class_name               = "Tensor";
my $template_dir                      = "~/dev/ClassGen";
my $template_header_file_name         = "tensor.h";
my $template_implementation_file_name = "tensor.cpp";

# assempble the complete file pathsj
my $template_header_path = 
  $template_dir . "/" . $template_header_file_name;
my $template_implementation_path = 
  $template_dir . "/" . $template_implementation_file_name;

# declare variables to be used later
my $output_header_path;
my $output_implementation_path;
my $class_name;
my $namespace;

# prompt user for name of class and namespace
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

# read the template header file, line by line
while (<TEMPLATE_HEADER_FILE>)
{
  replace_template_keywords();
}

# replace_template_keywords
# @param    file type (e.g. HEADER_FILE_TYPE)
# @return   void
sub replace_template_keywords
{
  # process input parameters
  my $file_type = $_[0];
  if ($file_type == HEADER_FILE_TYPE)
    $file_name = $template_header_file_name;
  elsif ($file_type == IMPLEMENTATION_FILE_TYPE)
    $file_name = $template_implementation_file_name;

  # replace namespace
  $_ =~ s/$template_namespace/$namespace/;

  # replace class name
  $_ =~ s/$template_class_name/$class_name/;

  # replace file name
  my $replacement_file_name = generalte_file_name($file_type);
  $= =~ s/$file_name/$replacement_file_name/;

  # replace include guard
###############################################################################
###############################################################################
######################### COMPLETE THIS SECTION ###############################
###############################################################################
###############################################################################

}

# generate_file_name
# @param    file type (e.g. HEADER_FILE_TYPE)
# @return   file name (e.g. "tensor.cpp")
sub generate_file_name
{
  my $file_type = $_[0];
  my $file_name = $class_name;

  # determine file extension
  my $file_extension;
  if ($file_type == HEADER_FILE_TYPE)
    $file_extension = ".h";
  elsif ($file_type == IMPLEMENTATION_FILE_TYPE)
    $file_extension = ".cpp";

  # precede each non-leading uppercase letter with an underscore
  # (e.g. "ThisIsAClass" --> "This_Is_A_Class")
  $file_name =~ s/^.+?([A-Z])/_\1/;
  
  # replace each uppercase letter with its lowercase equivalent
  $file_name =~ tr/[A-Z]/[a-z]/;

  return file_name; # not necessary in Perl, but gives better clarity
}

