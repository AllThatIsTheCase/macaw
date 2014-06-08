require 'bundler/gem_tasks'
require 'fileutils'

task :default => :update

task :publish do
  echo "git tag #{Macaw::VERSION}"
  echo "git push"
  echo "rm -f pkg/*"
  Rake::Task["install"].invoke
  echo "gem push #{Dir['pkg/*.gem'].join(' ')}"
end

task :test do
  require './lib/macaw'
end
