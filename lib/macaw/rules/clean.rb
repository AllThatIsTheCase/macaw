# Clean rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  def clean(files)
    files.reject{|f| f.downcase == @file.downcase}.each{|f|
      File.unlink(f)
    }
  end
end
