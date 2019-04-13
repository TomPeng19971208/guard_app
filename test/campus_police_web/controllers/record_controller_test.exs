defmodule CampusPoliceWeb.RecordControllerTest do
  use CampusPoliceWeb.ConnCase

  alias CampusPolice.Records
  alias CampusPolice.Records.Record

  @create_attrs %{
    date: "2010-04-17T14:00:00Z",
    description: "some description",
    x-location: 120.5,
    y-location: 120.5,
    zip: "some zip"
  }
  @update_attrs %{
    date: "2011-05-18T15:01:01Z",
    description: "some updated description",
    x-location: 456.7,
    y-location: 456.7,
    zip: "some updated zip"
  }
  @invalid_attrs %{date: nil, description: nil, "x-location": nil, "y-location": nil, zip: nil}

  def fixture(:record) do
    {:ok, record} = Records.create_record(@create_attrs)
    record
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all records", %{conn: conn} do
      conn = get(conn, Routes.record_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create record" do
    test "renders record when data is valid", %{conn: conn} do
      conn = post(conn, Routes.record_path(conn, :create), record: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.record_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2010-04-17T14:00:00Z",
               "description" => "some description",
               "x-location" => 120.5,
               "y-location" => 120.5,
               "zip" => "some zip"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.record_path(conn, :create), record: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update record" do
    setup [:create_record]

    test "renders record when data is valid", %{conn: conn, record: %Record{id: id} = record} do
      conn = put(conn, Routes.record_path(conn, :update, record), record: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.record_path(conn, :show, id))

      assert %{
               "id" => id,
               "date" => "2011-05-18T15:01:01Z",
               "description" => "some updated description",
               "x-location" => 456.7,
               "y-location" => 456.7,
               "zip" => "some updated zip"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, record: record} do
      conn = put(conn, Routes.record_path(conn, :update, record), record: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete record" do
    setup [:create_record]

    test "deletes chosen record", %{conn: conn, record: record} do
      conn = delete(conn, Routes.record_path(conn, :delete, record))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.record_path(conn, :show, record))
      end
    end
  end

  defp create_record(_) do
    record = fixture(:record)
    {:ok, record: record}
  end
end
