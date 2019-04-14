defmodule CampusPoliceUtil.API do

  def send(msg, dst_num) do
    ExTwilio.Api.create(ExTwilio.Message,
    [to: dst_num,
     from: 18057386912,
      body: msg])
  end

  def get_lat_long_zip(address) do
    address = Regex.replace(~r/\s/, address, "+")
    key=Application.get_env(:campus_police, :google_api_key)
    url="https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{key}"
    resp = HTTPoison.get!(url)
    resp = Jason.decode!(resp.body)
    location = hd(resp["results"])["geometry"]["location"]
    address_component = hd(resp["results"])["address_components"]
    zip = Enum.find(address_component, fn x -> x["types"]==["postal_code"] end)["long_name"]
    %{x: location["lng"], y: location["lat"], zip: zip}
  end

  def broadcast_msgs(msg, numbers) do
    Enum.each(numbers, fn n -> CampusPoliceUtil.API.send(msg, n) end)
  end

  def get_address(x, y) do
    key=Application.get_env(:campus_police, :google_api_key)
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{y},#{x}&key=#{key}"
    resp = HTTPoison.get!(url)
    resp = Jason.decode!(resp.body)
    data = hd(resp["results"])
    address = data["formatted_address"]
    address_component = hd(resp["results"])["address_components"]
    zip = Enum.find(address_component, fn x -> x["types"]==["postal_code"] end)["long_name"]
    %{address: address, zip: zip}
  end

end
