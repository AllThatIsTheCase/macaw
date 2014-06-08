# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  rule :dvipsps2pdf => opt: %i{options}, req: [] do |parameters|
    parameters.output ||= @base
    Macaw.system "dvips #{"#{@base}.dvi".shellescape} -o #{"#{@base}.ps".shellescape} #{parameters.options}"
    Macaw.system "ps2pdf #{parameters.options} #{"#{@base}.ps".shellescape} #{"#{parameters.output}.pdf".shellescape}"
  end
end
