# sumatrapdf rule for arara
class Macaw
  def sumatrapdf
    Macaw.log('spawning sumatrapdf...')

    pdf = ~"#{@base}.pdf"
    Process.spawn "sumatrapdf -reuse-instance #{pdf}"
  end
end
