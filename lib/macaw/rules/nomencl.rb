# Nomencl rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def nomencl(style=nil, options=nil)
    style ||= nomencl

    cmd = ['makeindex']
    cmd << options
    cmd << ~"#{@base}.nlo"
    cmd << '-s ' + ~"#{style}.ist" if style
    cmd << '-o ' + ~"#{@base}.nls"

    Macaw.system cmd
  end
end
