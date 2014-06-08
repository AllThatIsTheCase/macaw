# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipsps2pdf(parameters)
    parameters.output ||= @base
    Macaw.system "dvips #{"#{@base}.dvi".shellescape} -o #{"#{@base}.ps".shellescape} #{parameters.options}"
    Macaw.system "ps2pdf #{parameters.options} #{"#{@base}.ps".shellescape} #{"#{parameters.output}.pdf".shellescape}"
  end
end
