# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  rule :dvips => opt: %i{options output}, opt: [] do |parameters|
    parameters.output ||= @base
    Macaw.system "dvips #{"#{@base}.dvi".shellescape} -o #{"#{parameters.output}.ps".shellescape} #{parameters.options}"
  end
end
