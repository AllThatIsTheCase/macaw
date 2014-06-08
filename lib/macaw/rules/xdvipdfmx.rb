# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipdfmx(output=nil, options=nil)
    output ||= base
    Macaw.system ['xdvipdfmx', ~"#{@base}.dvi", '-o', ~"#{output}.ps", options]
  end
end
