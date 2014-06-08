# songidx rule for arara
# author: Francesco Endrici
# requires arara 3.0
class Macaw
  def songidx(input)
    Macaw.system "songidx " + "#{input}.sxd".shellescape
  end
end
