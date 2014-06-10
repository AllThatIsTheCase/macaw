require 'bundler/gem_tasks'
require 'fileutils'
require 'yaml'
require 'pp'

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
  sh "cp test/test.tex ."
  sh "./bin/macaw -p -l"
  sh "rm test.*"
end


class LanguageManager
  class NoTranslation < StandardError; end

  def initialize
    @translations = {}
    Dir['lib/macaw/i18n/*.yml'].each{|yml|
      @translations[File.basename(yml, File.extname(yml))] = YAML.load_file(yml)
    }
    @en = @translations.delete('en')
    @keys = keys(@en[@en.keys[0]])
  end

  def keys(h, prefix=[])
    c = []
    h.each_pair{|k, v|
      if v.is_a?(Hash)
        c += keys(v, prefix + [k])
      else
        c << prefix + [k]
    end
    }
    c
  end

  def resolve(h, k)
    raise NoTranslation if h.nil?
    h = h[k.shift]
    return h if k.empty?
    return resolve(h, k)
  end

  def vars(s)
    v = []
    s.gsub(/%\{([^}]+)\}/){|k| v << k}
    return v.sort
  end

  def test
    @translations.values.each{|l|
      @keys.each{|k|
        ens = resolve(@en[@en.keys[0]], k.dup)
        ls = nil
        begin
          ls = resolve(l[l.keys[0]], k.dup)
        rescue NoTranslation
          ls = nil
        end

        if ls.to_s == ''
          puts "No translation: #{l.keys[0]}: #{k.join('.')}"
          next
        end

        puts "Var mismatch: #{l.keys[0]}: #{k.join('.')}; #{vars(ens).inspect} vs #{vars(ls).inspect}" if vars(ens) != vars(ls)
      }
    }
  end
end

task :tr do
  LanguageManager.new.test
end
