module StoresHelper

  def business_hours_collect
    arr = []
    (0..23).each do |i|
      ["00", "30"].each{|j|
        arr << ["#{i}:#{j}", "#{i}:#{j}"]
      }
    end
    arr<<["0:00", '0:00']
    arr
  end
end