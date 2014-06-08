# BibTeX rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def bibtex(options=nil)
    Macaw.system "bibtex #{options} #{~"#{@base}.aux"}"
  end
end
