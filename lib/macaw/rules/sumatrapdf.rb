# sumatrapdf rule for arara
class Macaw
  def sumatrapdf(pdf=nil)
    pdf ||= "#{@base}.pdf"

    Macaw.log('spawning sumatrapdf...')
    pdf = ~pdf
    Process.spawn "sumatrapdf -reuse-instance #{pdf}"
  end
end
