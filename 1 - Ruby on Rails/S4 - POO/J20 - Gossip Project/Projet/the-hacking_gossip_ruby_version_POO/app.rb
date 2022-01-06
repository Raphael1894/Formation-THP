require 'bundler'
Bundler.require
require 'colorize'
require_relative 'lib/router.rb'
require_relative 'lib/controller.rb'
require_relative 'lib/gossip.rb'
require_relative 'lib/view.rb'
require 'pry'
require 'csv'
#Nettoie le terminal
system 'clear'

Router.new.perform
