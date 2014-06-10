# texcount rule for arara
# author: Francesco Endrici
# requires arara 3.0
class Macaw
  # this probably needs to be a lot fancier, but I can't be arsed about it right now.
  def texcount(parameters)
    Macaw.system ['texcount'] + parameters
  end
end
