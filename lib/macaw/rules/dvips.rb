# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvips(parameters)
    parameters.output ||= @base
    Macaw.system "dvips #{"#{@base}.dvi".shellescape} -o #{"#{parameters.output}.ps".shellescape} #{parameters.options}"
  end
end
