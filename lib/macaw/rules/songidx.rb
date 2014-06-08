# songidx rule for arara
# author: Francesco Endrici
# requires arara 3.0
class Macaw
  rule :songidx => req: %i{input}, opt: [] do |parameters|
    Macaw.system "songidx " + "#{parameters.input}.sxd".shellescape
  end
end
