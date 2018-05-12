require 'spec_helper'
require 'card'
require 'pry-byebug'
require 'set'
require 'pty'

#acceptance tests, does the whole application work
BIN = File.expand_path("../../bin/play", __FILE__)

describe 'CLI', :acceptance do

  # before(:example) do
  #   dir = Dir.tmpdir + '/highcard_test_state'
  #   `rm -Rf #{dir}`
  #   `mkdir -p #{dir}`
  #   ENV['HIGHCARD_DIR'] = dir
  # end

  example 'it works' do
    setup_state
    PTY.spawn(BIN) do |output, input, pid|
      sleep 0.5
      input.write("y\n")
      sleep 0.5
      buffer = output.read_nonblock(1024)
      raise unless buffer.include?("You won") || buffer.include?("You lost")
    end
  end

  example 'betting on winning hand' do
    setup_state
    PTY.spawn(BIN) do |output, input, pid|
      sleep 0.5
    end
  end

end
