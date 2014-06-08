# Clean rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  rule :clean => req: %{files}, opt: [] do |parameters|
    parameters.files.reject{|f| f.downcase == @file.downcase}.each{|f|
      File.unlink(f)
    }
  end
end
