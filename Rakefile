require 'bundler/gem_tasks'
require 'fileutils'

task :default => :build

task :bump do
  version = Macaw::VERSION.split('.').collect{|v| Integer(v)}
  version[2] += 1
  version = version.collect{|v| v.to_s}.join('.')
  File.open('lib/macaw/version.rb', 'w'){|f| f.write("class Macaw\n  VERSION = #{version.inspect}\nend\n") }
  puts `git add lib/macaw/version.rb Gemfile.lock`
end

task :publish do
  sh "git tag #{Macaw::VERSION}"
  Dir['pkg/*.gem'].each{|f| File.unlink(f)}
  Rake::Task["build"].invoke
  sh "gem push #{Dir['pkg/*.gem'].join(' ')}"
  sh "git push"
end

task :test do
  require './lib/macaw'
end
