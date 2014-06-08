# BibTeX rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def bibtex(parameters)
    Macaw.system "bibtex #{parameters.options} #{"#{@base}.aux".shellescape}"
  end
end
