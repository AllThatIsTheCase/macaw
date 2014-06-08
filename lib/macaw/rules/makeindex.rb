# MakeIndex rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def makeindex(parameters)
    parameters.extension ||= 'idx'

    cmd = ['makeindex']
    cmd << '-g' if parameters.german
    cmd << "-s #{parameters.style}" if parameters.style
    cmd << "#{@base}.#{extension}".shellescape

    Macaw.system cmd
  end
end
