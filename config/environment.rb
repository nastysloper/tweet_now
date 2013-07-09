# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['TWITTER_CONSUMER_KEY'] = 'UgGb3fhYXMH5fjsUXBj8w'
ENV['TWITTER_CONSUMER_SECRET'] = 'wVi3dBst2dqONDbP8CrE9ktgnJbwLoz4GspCvOaCTPs'
ENV['TWITTER_OAUTH_TOKEN'] = '217263553-1kCTeKe4msOyuj9YX4slLlb08nkTD5G4Fl0NSaDY'
ENV['TWITTER_OAUTH_TOKEN_SECRET'] = 'FyOPmI2kgX4Ss7ewrIRYaZQ1WhvV5Wf4rlwY4dZkIYU'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'
require 'twitter'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
