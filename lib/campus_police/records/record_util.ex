defmodule RecordUtil do
   alias CampusPolice.Records

   defp calc_distance(p1, p2) do
     lat_long_dist = Distance.distance({p1.x, p1.y}, {p2.x, p2.y})
     Float.round(lat_long_dist*69, 2)
   end

   def get_records_nearby(x, y) do
     key="AIzaSyBe6sZGE3Z3NmYRNrqeKNgK6QTdWXr44sk"
     url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{y},#{x}&key=#{key}"
     IO.puts(url)
     resp = HTTPoison.get!(url)
     data = hd(Jason.decode!(resp.body)["results"])
     zipcode = List.last(data["address_components"])["long_name"]
     candidate_records = Records.list_record_by_zip(zipcode)
     Enum.filter(candidate_records, fn record -> calc_distance(%{x: x, y: y}, %{x: record.x, y: record.y}) <5 end)
   end

end
