# DVIPS rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def dvipdfm(options=nil, output=nil} do |parameters|
    output ||= @base
    Macaw.system "dvipdfm #{"#{@base}.dvi".shellescape} -o #{"#{output}.ps".shellescape} #{options}"
  end
end
