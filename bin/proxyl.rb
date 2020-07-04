#!/usr/bin/env ruby

require 'tty-spinner'
require 'colorize'
require 'http'
require_relative '../lib/scraper'
require_relative '../lib/file_manager'

spinner = TTY::Spinner.new(':spinner :title', format: :bouncing, hide_cursor: true)
document = nil
scraper = nil
file = nil

spinner.update(title: 'Downloading data...')
spinner.run('Done!') do |s|
  response = HTTP.get('https://free-proxy-list.net')
  document = response.body.to_s
  s.reset
end

spinner.update(title: 'Scraping...')
spinner.run('Done!') do |s|
  scraper = Scraper.new(document)
  scraper.scrape
  s.reset
end

spinner.update(title: 'Saving...')
spinner.run('Done!') do |s|
  file = FileManager.save(scraper.data.to_json, 'json')
  s.reset
end

puts "Data saved to: #{file}".colorize(:green)
