require 'date'

module Generate
  def new_key
    rand(00000..99999).to_s.rjust(5, "0")
  end

  def current_date
    today = Date.today
    today.strftime("%m%d%y")
  end
end
