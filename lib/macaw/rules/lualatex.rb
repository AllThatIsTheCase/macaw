# LuaLaTeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def lualatex(action=nil, shell=nil, synctex=nil, draft=nil, options=nil)
    cmd = ['lualatex']
    cmd << "--interaction=#{action}" if action
    cmd << '--draftmode' if draft
    cmd << "--#{shell ? '' : 'no-'}shell-escape"
    cmd << "--synctex=#{synctex ? 1 : 0}"
    cmd << options
    cmd << ~@file

    Macaw.system cmd
  end
end
