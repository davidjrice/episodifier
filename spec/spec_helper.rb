require 'rubygems'
require 'rspec' unless defined? Spec
require File.dirname(__FILE__) + '/../lib/episodifier'
require File.join(File.dirname(__FILE__), "episodifier_matcher")
# Spec::Example::ExampleGroupMethods.send(:include, EpisodifierMatcher)
