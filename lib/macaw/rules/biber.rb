class Macaw
  def biber(parameters)
    Macaw.system("biber #{parameters.options} #{@base.shellescape}")
  end
end
