#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/logger'
require_relative '../lib/file_reader'
require_relative '../lib/list_pages'
require 'optparse'

DEFAULT_BATCH_SIZE = 1000

options = { uniq: false }
OptionParser.new do |opts|
  opts.banner = 'Usage: parser.rb [log_path] [options]'
  opts.on('-u', '--uniq', 'Uniq user view (default false)') { |v| options[:uniq] = v }
  opts.on('-p', '--path PATH', 'Path of parsed file') { |p| options[:path] = p }
end.parse!

if options[:path].is_a? String
  lines = FileReader.new(options[:path], DEFAULT_BATCH_SIZE).parse
  list = ListPages.new(lines, uniq: options[:uniq]).call
  Logger.print_str("List all pages (uniq per page: #{options[:uniq]})\n", :yellow)
  Logger.print_logs(list)
else
  Logger.print_str('Please, provide correct file name! More info ruby bin/parser.rb --help', :red)
end
