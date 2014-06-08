# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  rule :dvipdfm => req: [], opt: %i{options output} do |parameters|
    parameters.output ||= @base
    Macaw.system "dvipdfm #{"#{@base}.dvi".shellescape} -o #{"#{parameters.output}.ps".shellescape} #{parameters.options}"
  end
end
