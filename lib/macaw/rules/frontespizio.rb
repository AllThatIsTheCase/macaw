# Frontespizio rule for arara
# author: Francesco Endrici
# author: Enrico Gregorio
# requires arara 3.0+
class Macaw
  def frontespizio(engine)
    engine ||= 'pdflatex'

    Macaw.system "#{engine} #{~@base}"
    Macaw.system "#{engine} #{~"#{@base}-frn"}"
    Macaw.system "dvips -o #{~"#{@base}-frn.eps"} #{~"#{@base}-frn"}" if engine == 'latex'
    Macaw.system "#{engine} #{~@base}"
  end
end
