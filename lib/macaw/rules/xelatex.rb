# XeLaTeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def xelatex(action, shell=nil, synctex=nil, options=nil)
    Macaw.system [
      'xelatex',
      "--interaction=#{action}",
      "--#{shell ? '' : 'no-'}shell-escape",
      "--synctex=#{syntex ? 1 : 0}",
      options,
      @file.shellescape
    ]
  end
end
