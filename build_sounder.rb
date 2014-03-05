require 'rspec/core/formatters/progress_formatter'
# dirty hack, see: https://github.com/carlhuda/bundler/issues/183
$LOAD_PATH.concat Dir.glob("#{ENV['rvm_path']}/gems/#{ENV['RUBY_VERSION']}@global/gems/*/lib")

class BuildSounder < RSpec::Core::Formatters::ProgressFormatter

  SUCCESS_SOUND = "/usr/share/sounds/LinuxMint/stereo/desktop-login.ogg"
  FAILURE_SOUND = "/usr/share/sounds/gnome/default/alerts/bark.ogg"

  def dump_summary(duration, example_count, failure_count, pending_count)
    if failure_count.zero?
      fork{ exec "mpg123", "-q" FAILURE_SOUND }
    else
      fork{ exec "mpg123", "-q" SUCCESS_SOUND }
    end
  end

end