require 'bundler'
require 'gems'

module GemChecker
  class Parser
    def initialize(gemfile_lock)
      @gemfile_lock = gemfile_lock
    end

    def parse
      parser = Bundler::LockfileParser.new(File.read(@gemfile_lock))
      gem_names = parser.dependencies.map { |t| t[0] }
      versions = []

      parser.specs.each do |gem|
        next unless gem_names.include?(gem.name)

        puts gem.name

        begin
          res = Gems.info(gem.name)
          next unless res
        rescue Gems::NotFound
          next
        end

        latest_version = res['version']
        latest_version_at = Time.parse(res['version_created_at'])

        data = {
          name: gem.name,
          current_version: gem.version.to_s,
          current_version_at: 0,
          latest_version: latest_version,
          latest_version_at: time_format(latest_version_at)
        }

        if gem.version.to_s == latest_version
          current_version_at = time_format(latest_version_at)
          outdated_days = 0
        else
          begin
            version = Gems::V2.info(gem.name, gem.version.to_s)
            if version
              time = Time.parse(version['created_at'])
              current_version_at = time_format(time)
              outdated_days = (Time.now.to_date - time.to_date).to_i
            else
              current_version_at = ''
              outdated_days = ''
            end
          rescue Gems::NotFound
            current_version_at = ''
            outdated_days = ''
          end
        end

        versions << data.merge!(outdated_days: outdated_days, current_version_at: current_version_at)
      end
      versions
    end

    def time_format(time)
      time.strftime('%Y-%m-%d %H:%M:%S')
    end
  end
end
