require File.expand_path('../config/boot.rb', __FILE__)
require 'padrino-core/cli/rake'
require 'cucumber/rake/task'

PadrinoTasks.init

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

desc "Run spec and features"
task :all_tests => [:features, :spec]