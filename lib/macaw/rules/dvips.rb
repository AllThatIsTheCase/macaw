# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvips(options=nil, output=nil)
    output ||= @base
    Macaw.system "dvips #{~"#{@base}.dvi"} -o #{~"#{output}.ps"} #{options}"
  end
end
