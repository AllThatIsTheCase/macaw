# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipsps2pdf(options=nil, output=nil)
    output ||= @base
    Macaw.system "dvips #{"#{@base}.dvi".shellescape} -o #{"#{@base}.ps".shellescape} #{options}"
    Macaw.system "ps2pdf #{options} #{"#{@base}.ps".shellescape} #{"#{output}.pdf".shellescape}"
  end
end
