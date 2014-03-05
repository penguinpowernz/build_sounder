require 'rspec/core/formatters/progress_formatter'
require 'yaml'

class BuildSounder < RSpec::Core::Formatters::ProgressFormatter

  def initialize(output)
    super(output)
    @sounds = YAML.load_file("#{File.expand_path(File.dirname(__FILE__))}/sounds.yml")
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    super
    if failure_count.zero?
      play @sounds[:success]
    else
      play @sounds[:failure]
    end
  end

  def play(file)
    puts "BuildSounder: Can't find #{file}" and
      return if !File.exist?(file)
    
    case File.extname(file)
    when ".mp3"
      fork{ exec "mpg123", "-q", file }
    when ".ogg"
      fork{ exec "ogg123", "-q", file }
    end
  end

end
