# Biber rule for arara
# author: Marco Daniel
# requires arara 3.0+
class Macaw
  def biber(parameters)
    Macaw.system("biber #{parameters.options} #{@base.shellescape}")
  end
end
