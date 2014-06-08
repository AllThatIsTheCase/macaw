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
  rule :indent => opt: %i{overwrite silent trace localSettings output onlyDefault cruft}, req: [] do |parameters|
    cmd = ["latexindent.#{os.windows? ? 'exe' : 'pl'}"]
    cmd << '-s' if parameters.silent
    cmd << '-t' if parameters.trace
    cmd << '-l' if parameters.localSettings
    cmd << "-c=#{parameters.cruft.shellescape}" if parameters.cruft
    cmd << '-w' if parameters.overwrite
    cmd << '-d' parameters.onlyDefault
    cmd << "-o #{parameters.output.shellescape}" if parameters.output
    cmd << @file.shellescape
    cmd << parameters.output.shellescape if parameters.output

    Macaw.system cmd
  end
end
