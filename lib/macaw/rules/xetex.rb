# XeLaTeX rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  def xetex(action, shell=nil, synctex=nil, options=nil)
    Macaw.system [
      'xetex',
      "--interaction=#{action}",
      "--#{shell ? '' : 'no-'}shell-escape",
      "--synctex=#{synctex ? 1 : 0}",
      options,
      ~@file
    ]
  end
end
