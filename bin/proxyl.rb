#!/usr/bin/env ruby

require 'tty-spinner'
require 'colorize'
require 'http'
require_relative '../lib/scrapper'
require_relative '../lib/file_manager'

spinner = TTY::Spinner.new(':spinner :title', format: :bouncing, hide_cursor: true)
document = nil
scrapper = nil
file = nil

spinner.update(title: 'Downloading data...')
spinner.run('Done!') do |s|
  response = HTTP.get('https://free-proxy-list.net')
  document = response.body.to_s
  s.reset
end

spinner.update(title: 'Scrapping...')
spinner.run('Done!') do |s|
  scrapper = Scrapper.new(document)
  scrapper.scrape
  s.reset
end

spinner.update(title: 'Saving...')
spinner.run('Done!') do |s|
  file = FileManager.save(scrapper.data.to_json, 'json')
  s.reset
end

puts "Data saved to: #{file}".colorize(:green)
