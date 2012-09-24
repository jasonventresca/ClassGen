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
my $template_dir                      = "/Users/Jason/dev/ClassGen";
my $template_header_file_name         = "tensor.h";
my $template_implementation_file_name = "tensor.cpp";
my $template_include_guard            = "TENSOR_H";

# assempble the complete file pathsj
my $template_header_path = 
  $template_dir . "/" . $template_header_file_name;
my $template_implementation_path = 
  $template_dir . "/" . $template_implementation_file_name;

# declare variables to be used later
my $output_header_path;
my $output_implementation_path;
my $output_header_file_name;
my $output_implementation_file_name;
my $class_name;
my $namespace;

# prompt user for name of class and namespace
print "Class name (e.g. Tensor): ";
$class_name = <>;
chomp($class_name);

print "Namespace (e.g. Math): ";
$namespace = <>;
chomp($namespace);

# determine output file names and full paths
$output_header_file_name = generate_file_name(HEADER_FILE_TYPE);
$output_implementation_file_name = generate_file_name(IMPLEMENTATION_FILE_TYPE);

# open template files
open TEMPLATE_HEADER_FILE, $template_header_path
  or die "Could not open template file: " . $template_header_path;

open TEMPLATE_IMPLEMENTATION_FILE, $template_implementation_path
  or die "Could not open template file: " . $template_implementation_path;

# open output files
open OUTPUT_HEADER_FILE, "> " . $output_header_file_name
  or die "Could not open output file: " . $output_header_file_name;

open OUTPUT_IMPLEMENTATION_FILE, "> " . $output_implementation_file_name
  or die "Could not open output file: " . $output_implementation_file_name;

# read the template header file, line by line
while (<TEMPLATE_HEADER_FILE>)
{
  # make the appropriate replacements and print them to the output file
  print OUTPUT_HEADER_FILE replace_template_keywords(HEADER_FILE_TYPE);
}

# read the template implementation file, line by line
while (<TEMPLATE_IMPLEMENTATION_FILE>)
{
  # make the appropriate replacements and print them to the output file
  print OUTPUT_IMPLEMENTATION_FILE replace_template_keywords(IMPLEMENTATION_FILE_TYPE);
}

# replace_template_keywords
# @param    file type (e.g. HEADER_FILE_TYPE)
# @return   void
sub replace_template_keywords
{
  # process input parameters
  my $file_type = $_[0];

  # replace namespace
  $_ =~ s/$template_namespace/$namespace/g;

  # replace class name
  $_ =~ s/$template_class_name/$class_name/g;

  # replace file name
  my $replacement_header_file_name = generate_file_name(HEADER_FILE_TYPE);
  my $replacement_implementation_file_name = generate_file_name(IMPLEMENTATION_FILE_TYPE);
  $_ =~ s/$template_header_file_name/$replacement_header_file_name/g;
  $_ =~ s/$template_implementation_file_name/$replacement_implementation_file_name/g;

  # replace include guard
  my $replacement_include_guard = generate_include_guard();
  $_ =~ s/$template_include_guard/$replacement_include_guard/g;

  return $_;
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
  {
    $file_extension = ".h";
  }
  elsif ($file_type == IMPLEMENTATION_FILE_TYPE)
  {
    $file_extension = ".cpp";
  }

  # precede each non-leading uppercase letter with an underscore
  # (e.g. "ThisIsAClass" --> "This_Is_A_Class")
  $file_name =~ s/([A-Z])/_$1/g;
  $file_name =~ s/^_(.*)/$1/;
  
  # replace each uppercase letter with its lowercase equivalent
  $file_name =~ tr/[A-Z]/[a-z]/;

  return $file_name . $file_extension;
}

# generate_include_guard
# @param    (void)
# @return   include guard macro
# @brief    transforms the class name into an include guard macro
#           ( e.g. Tensor  -->  TENSOR_H )
sub generate_include_guard
{
  my $replacement_include_guard = $class_name;

  # precede each non-leading uppercase letter with an underscore
  # (e.g. "ThisIsAClass" --> "This_Is_A_Class")
  $replacement_include_guard =~ s/([A-Z])/_$1/g;
  $replacement_include_guard =~ s/^_(.*)/$1/;
  
  # replace each lowercase letter with its uppercase equivalent
  $replacement_include_guard =~ tr/[a-z]/[A-Z]/;

  # append the "_H" (e.g. THIS_IS_A_CLASS --> THIS_IS_A_CLASS_H)
  $replacement_include_guard .= "_H";

  # return statement not necessary in Perl, but gives better clarity
  return $replacement_include_guard;
}

