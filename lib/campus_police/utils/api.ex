defmodule CampusPoliceUtil.API do

  def send(msg, dst_num) do
    ExTwilio.Api.create(ExTwilio.Message,
    [to: dst_num,
     from: 18057386912,
     body: msg])
  end

  def get_lat_long(address) do
    address = Regex.replace(~r/\s/, address, "+")
    key="AIzaSyBe6sZGE3Z3NmYRNrqeKNgK6QTdWXr44sk"
    url="https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{key}"
    resp = HTTPoison.get!(url)
    resp = Jason.decode!(resp.body)
    location = hd(resp["results"])["geometry"]["location"]
    %{x: location["lng"], y: location["lat"]}
  end

end
