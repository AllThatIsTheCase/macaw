# PS2PDF rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  rule :ps2pdf => opt: %i{options output}, req: [] do |parameters|
    parameters.output ||= @base

    cmd = ['ps2pdf']
    cmd << parameters.options
    cmd << "#{@base}.ps".shellescape
    cmd << "#{parameters.output}.pdf".shellescape

    Macaw.system cmd
  end
end
