# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipsps2pdf(options=nil, output=nil)
    output ||= @base
    Macaw.system "dvips #{~"#{@base}.dvi"} -o #{~"#{@base}.ps"} #{options}"
    Macaw.system "ps2pdf #{options} #{~"#{@base}.ps"} #{~"#{output}.pdf"}"
  end
end
