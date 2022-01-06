require 'bundler'
Bundler.require
require 'pry'
require 'time'
require './lib/user.rb'
require './lib/event.rb'


system 'clear'

julie = User.new("julie@julie.com", 23)
jean = User.new("jean@jean.com", 27)

event1 = Event.new("18/06/1994 14:00", 30, "Réunion importante", [julie, jean])
meeting = WorkEvent.new("2019-01-17 09:00", 50, "réunion de travail", [julie, jean], "Perpignan")

binding.pry

