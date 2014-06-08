# Frontespizio rule for arara
# author: Francesco Endrici
# author: Enrico Gregorio
# requires arara 3.0+
class Macaw
  def frontespizio(engine)
    engine ||= 'pdflatex'

    Macaw.system "#{engine} #{@base.shellescape}"
    Macaw.system "#{engine} #{"#{@base}-frn".shellescape}"
    Macaw.system "dvips -o #{"#{@base}-frn.eps".shellescape} #{"#{@base}-frn".shellescape}" if engine == 'latex'
    Macaw.system "#{engine} #{@base.shellescape}"
  end
end
