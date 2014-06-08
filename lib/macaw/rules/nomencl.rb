# Nomencl rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def nomencl(style=nil, options=nil)
    style ||= nomencl

    cmd = ['makeindex']
    cmd << options
    cmd << "#{@base}.nlo".shellescape
    cmd << '-s ' + "#{style}.ist".shellescape if style
    cmd << '-o ' + "#{@base}.nls".shellescape

    Macaw.system cmd
  end
end
