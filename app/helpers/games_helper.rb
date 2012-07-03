module GamesHelper
  
  def use_zone(time_zone)
    new_zone = find_zone!(time_zone)
    begin
      old_zone, ::Time.zone = ::Time.zone, new_zone
      yield
    ensure
      ::Time.zone = old_zone
    end
  end
  
end
