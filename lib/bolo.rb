# require bolo/*rb
Dir["#{File.dirname(__FILE__)}/bolo/*.rb"].each do |path|
  next if File.basename(path, '.rb') == 'core_ext'
  require "bolo/#{File.basename(path, '.rb')}"
end

# require bolo/core_ext/*rb
Dir["#{File.dirname(__FILE__)}/bolo/core_ext/*.rb"].each do |path|
  require "bolo/core_ext/#{File.basename(path, '.rb')}"
end

module Bolo
  class BoloError < StandardError; end
end
