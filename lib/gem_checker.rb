# frozen_string_literal: true

require 'gem_checker/version'
require 'gem_checker/parser'
require 'gem_checker/csv'
require 'byebug'

module GemChecker
  class Error < StandardError; end

  def self.check(gemfile_lock = 'Gemfile.lock')
    raise Error, "Gemfile.lock not found in the application." unless File.exist?(gemfile_lock)

    versions = Parser.new(gemfile_lock).parse
    Csv.new(versions)
  end
end
