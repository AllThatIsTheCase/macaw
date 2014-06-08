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
  def indent(overwrite=nil, silent=nil, trace=nil, localSettings=nil, output=nil, onlyDefault=nil, cruft=nil)
    cmd = ["latexindent.#{OS.windows? ? 'exe' : 'pl'}"]
    cmd << '-s' if silent
    cmd << '-t' if trace
    cmd << '-l' if localSettings
    cmd << "-c=#{~cruft}" if cruft
    cmd << '-w' if overwrite
    cmd << '-d' if onlyDefault
    cmd << "-o #{~output}" if output
    cmd << ~@file
    cmd << ~output if output

    Macaw.system cmd
  end
end
