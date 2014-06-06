require 'bundler/gem_tasks'
require 'fileutils'

task :default => :update

task :publish do
  sh "git tag #{Macaw::VERSION}"
  sh "git push"
  sh "rm -f pkg/*"
  Rake::Task["install"].invoke
  sh "gem push #{Dir['pkg/*.gem'].join(' ')}"
end

task :test do
  require './lib/macaw'
  File.open(File.dirname(__FILE__) + '/__TEXT__').read.strip.scan(/[[:alpha:]]{2,}/).each{|w|
    puts w.inspect
    w.macaw.downcase
  }
end
