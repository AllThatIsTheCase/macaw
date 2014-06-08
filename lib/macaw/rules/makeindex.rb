# MakeIndex rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def makeindex(style=nil, german=nil, options=nil, extension=nil)
    extension ||= 'idx'

    cmd = ['makeindex']
    cmd << '-g' if german
    cmd << "-s #{style}" if style
    cmd << "#{@base}.#{extension}".shellescape

    Macaw.system cmd
  end
end
