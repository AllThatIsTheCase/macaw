require 'bundler/gem_tasks'
require 'fileutils'

task :default => :build

task :publish do
  version = Macaw::VERSION.split('.').collect{|v| Integer(v)}
  version[2] += 1
  version = version.collect{|v| v.to_s}.join('.')
  File.open('lib/macaw/version.rb', 'w'){|f| f.write("class Macaw\n  VERSION = #{version.inspect}\nend\n") }

  sh "git tag #{version}"
  sh "git push"
  sh "rm -f pkg/*"
  Rake::Task["build"].invoke
  sh "gem push #{Dir['pkg/*.gem'].join(' ')}"
end

task :test do
  require './lib/macaw'
end
