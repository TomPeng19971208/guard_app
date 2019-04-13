defmodule CampusPolice.RecordsTest do
  use CampusPolice.DataCase

  alias CampusPolice.Records

  describe "records" do
    alias CampusPolice.Records.Record

    @valid_attrs %{date: "2010-04-17T14:00:00Z", description: "some description", "x-location": 120.5, "y-location": 120.5, zip: "some zip"}
    @update_attrs %{date: "2011-05-18T15:01:01Z", description: "some updated description", "x-location": 456.7, "y-location": 456.7, zip: "some updated zip"}
    @invalid_attrs %{date: nil, description: nil, "x-location": nil, "y-location": nil, zip: nil}

    def record_fixture(attrs \\ %{}) do
      {:ok, record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_record()

      record
    end

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Records.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Records.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      assert {:ok, %Record{} = record} = Records.create_record(@valid_attrs)
      assert record.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert record.description == "some description"
      assert record.x-location == 120.5
      assert record.y-location == 120.5
      assert record.zip == "some zip"
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      assert {:ok, %Record{} = record} = Records.update_record(record, @update_attrs)
      assert record.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert record.description == "some updated description"
      assert record.x-location == 456.7
      assert record.y-location == 456.7
      assert record.zip == "some updated zip"
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record(record, @invalid_attrs)
      assert record == Records.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Records.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Records.change_record(record)
    end
  end
end
