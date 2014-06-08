# Nomencl rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  rule :nomencl => opt: %i{style options}, req: [] do |parameters|
    parameters.style ||= nomencl

    cmd = ['makeindex']
    cmd << parameter.options
    cmd << "#{@base}.nlo".shellescape
    cmd << '-s ' + "#{parameters.style}.ist".shellescape if parameters.style
    cmd << '-o ' + "#{@base}.nls".shellescape

    Macaw.system cmd
  end
end
