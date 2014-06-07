class Macaw
  def clean(parameters)
    sleep(parameters.wait || 0)
    (parameters.files || []).reject{|f| f.downcase == @file.downcase}.each{|f|
      File.unlink(f)
    }
  end
end
