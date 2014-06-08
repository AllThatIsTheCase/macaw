# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipdfmx(options=nil, output=nil)
    output ||= @base
    Macaw.system "dvipdfmx #{"#{@base}.dvi".shellescape} -o #{"#{output}.ps".shellescape} #{options}"
  end
end
