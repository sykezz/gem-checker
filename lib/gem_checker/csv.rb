require 'csv'

module GemChecker
  class Csv
    def initialize(versions)
      CSV.open('gem_versions.csv', 'w') do |csv|
        return unless versions.first.respond_to?(:keys)

        csv << versions.first.keys
        versions.each do |data|
          csv << data.values
        end
      end
    end
  end
end
