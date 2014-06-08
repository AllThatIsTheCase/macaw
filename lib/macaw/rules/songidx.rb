# songidx rule for arara
# author: Francesco Endrici
# requires arara 3.0
class Macaw
  def songidx(parameters)
    Macaw.system "songidx " + "#{parameters.input}.sxd".shellescape
  end
end
