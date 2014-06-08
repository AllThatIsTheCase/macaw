# Clean rule for arara
# author: Paulo Cereda
# requires arara 3.0+
class Macaw
  def clean(parameters)
    return unless parameters.files
    sleep(parameters.wait) if paramaters.wait.to_i != 0
    parameters.files.reject{|f| f.downcase == @file.downcase}.each{|f|
      File.unlink(f)
    }
  end
end
