# TeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def tex(action, shell=nil, options=nil)
    Macaw.system ['tex', action ? "--interaction=#{action}" : nil, "--#{shell ? '' : 'no-'}shell-escape", options, ~@file]
  end
end
