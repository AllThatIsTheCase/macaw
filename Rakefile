require 'bundler/gem_tasks'
require 'fileutils'
require 'yaml'
require 'pp'
require 'java_properties'

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

  def port
    Dir['arara/translations/*.input'].each{|prop|
      lang = File.basename(prop, File.extname(prop)).gsub('_', '-').gsub(/^Messages-/, '')
      lang = 'en' if lang == 'Messages'
      next if lang == 'Messages.sample'
      strings = JavaProperties::Properties.new(prop)

      tr = {lang => {}}
      strings.each{|key, value|
        section, localkey = *key.to_s.split('_', 2)
        section.downcase!

        case key
          when :Log_ProcessingFile, :Msg_NoDirectivesFound, :Error_FileDoesNotExist
            value.gsub!('{0}', '%{file}')
          when :Msg_SpecialThanks
            value.gsub!(/Alan.*Kottwitz/i, '%{contributors}')
          when :Error_InvalidLanguageConfigurationFile
            value.gsub!('{0}', '%{languages}')
        end

        value.gsub!(/(\{[0-9]+\})/){"%#{$1}"}
        value.gsub!('arara', 'macaw')
        value.gsub!('Arara', 'Macaw')
        value.gsub!("''", '"')

        tr[lang][section] ||= {}
        tr[lang][section][localkey] = value
      }
      tr[lang]['help']['Usage'] ||= 'Usage'
      tr[lang]['help']['Progress'] ||= 'Print dots to mark progress'
      File.open("lib/macaw/i18n/#{lang}.yml", 'w'){|f| f.write(tr.to_yaml)}
    }
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

task :gettranslations do
  LanguageManager.new.port
end

task :checktranslations do
  LanguageManager.new.test
end
