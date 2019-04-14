defmodule CampusPoliceUtil.API do

  def send(msg, dst_num) do
    ExTwilio.Api.create(ExTwilio.Message,
    [to: dst_num,
     from: 18057386912,
     body: msg])
  end

  def get_lat_long_zip(address) do
    address = Regex.replace(~r/\s/, address, "+")
    key="AIzaSyBe6sZGE3Z3NmYRNrqeKNgK6QTdWXr44sk"
    url="https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{key}"
    resp = HTTPoison.get!(url)
    resp = Jason.decode!(resp.body)
    location = hd(resp["results"])["geometry"]["location"]
    address_component = hd(resp["results"])["address_components"]
    zip = List.last(address_component)["long_name"]
    %{x: location["lng"], y: location["lat"], zip: zip}
  end

  def broadcast_msgs(msg, numbers) do
    Enum.each(numbers, fn n -> CampusPoliceUtil.API.send(msg, n) end)
  end

  def get_address(x, y) do
    key="AIzaSyBe6sZGE3Z3NmYRNrqeKNgK6QTdWXr44sk"
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{y},#{x}&key=#{key}"
    resp = HTTPoison.get!(url)
    data = hd(Jason.decode!(resp.body)["results"])
    address = data["formatted_address"]
    %{address: address}
  end

end
