# Biber rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def biber(options=nil)
    Macaw.system "biber #{options} #{~@base}"
  end
end
