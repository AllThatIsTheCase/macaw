# PS2PDF rule for arara
# author: Marco Daniel
# last edited by: Paulo Cereda
# requires arara 3.0+
class Macaw
  def ps2pdf(options=nil, output=nil)
    output ||= @base

    cmd = ['ps2pdf']
    cmd << options
    cmd << "#{@base}.ps".shellescape
    cmd << "#{output}.pdf".shellescape

    Macaw.system cmd
  end
end
