# Frontespizio rule for arara
# author: Francesco Endrici
# author: Enrico Gregorio
# requires arara 3.0+
class Macaw
  def frontespizio(parameters)
    parameters.engine ||= 'pdflatex'

    Macaw.system "#{parameters.engine} #{@base.shellescape}"
    Macaw.system "#{parameters.engine} #{"#{@base}-frn".shellescape}"
    Macaw.system "dvips -o #{"#{@base}-frn.eps".shellescape} #{"#{@base}-frn".shellescape}" if parameters.engine == 'latex'
    Macaw.system "#{parameters.engine} #{@base.shellescape}"
  end
end
