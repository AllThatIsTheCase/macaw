require 'os'
# indent rule for arara
# author: Paulo Cereda, Chris Hughes
# last updated: 11/9/2013
# requires arara 3.0+
#
# Sample usage:
#
# % arara: indent
# % arara: indent: {overwrite: yes}
# % arara: indent: {output: myfile.tex, silent: no}
# % arara: indent: {output: myfile.tex, silent: yes, overwrite: yes}
# % arara: indent: {trace: true}
# % arara: indent: {localSettings: true}
# % arara: indent: {onlyDefault: on}
# % arara: indent: { cruft: /home/cmhughes/Desktop }
#
# Directories with spaces will cause issues in the cruft call.
# 
# Note: output will take priority above overwrite
class Macaw
  def indent(parameters)
    params = ''
    params << ' -s' if isTrue(parameters.silent)
    params << ' -t' if isTrue(parameters.trace)
    params << ' -l' if isTrue(parameters.localSettings)
    params << " -c=#{parameters.cruft.shellescape}" if parameters.cruft
    params << ' -w' if isTrue(parameters.overwrite)
    params << ' -d' isTrue(parameters.onlyDefault)
    params << " -o #{parameters.output.shellescape}" if parameters.output
    params << " #{@file.shellescape}"
    params << " #{parameters.output.shellescape}" if parameters.output
    Macaw.system("latexindent.#{os.windows? ? 'exe' : 'pl'} #{params}")
  end
end
