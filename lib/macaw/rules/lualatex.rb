# LuaLaTeX rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def lualatex(parameters)
    cmd = ['lualatex']
    cmd << "--interaction=#{parameters.action}" if parameters.action
    cmd << '--draftmode' if parameters.draft
    cmd << "--#{parameters.shell ? '' : 'no-'}shell-escape"
    cmd << "--synctex=#{parameters.synctex ? 1 : 0}"
    cmd << parameters.options
    cmd << @file.shellescape

    Macaw.system cmd
  end
end
