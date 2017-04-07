require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task :default => :smoke

Cucumber::Rake::Task.new(:smoke) do |t|
    t.cucumber_opts = "-t @smoke --format html --out rake_test_results.html"
    t.bundler = false
end
