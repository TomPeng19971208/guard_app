defmodule CampusPoliceUtil.API do

  def send(msg, dst_num) do
    ExTwilio.Api.create(ExTwilio.Message,
    [to: dst_num,
     from: 18057386912,
     body: msg])
  end

end
