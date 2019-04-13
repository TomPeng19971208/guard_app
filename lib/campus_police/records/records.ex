defmodule CampusPolice.Records do
  @moduledoc """
  The Records context.
  """

  import Ecto.Query, warn: false
  alias CampusPolice.Repo

  alias CampusPolice.Records.Record
  alias CampusPolice.Types

  @doc """
  Returns the list of records.

  ## Examples

      iex> list_records()
      [%Record{}, ...]

  """
  def list_records do
    Repo.all(Record)
  end

  @doc """
  Gets a single record.

  Raises `Ecto.NoResultsError` if the Record does not exist.

  ## Examples

      iex> get_record!(123)
      %Record{}

      iex> get_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record!(id), do: Repo.get!(Record, id)

  def get_record(id) do
    Repo.get(Record, id)
    |> preload([:user])
  end

  @doc """
  Creates a record.

  ## Examples

      iex> create_record(%{field: value})
      {:ok, %Record{}}

      iex> create_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record(attrs \\ %{}) do
    types = Enum.map(attrs["types"], fn x -> Types.get_type(x) end)
    time = DateTime.utc_now
    time = DateTime.truncate(time, :second)
    attrs = Map.put(attrs, "date", time)
    %Record{}
    |> Record.changeset(attrs)
    |> Repo.insert!()
    |> Repo.preload([:types])
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:types, types)
    |> Repo.update
  end

  @doc """
  Updates a record.

  ## Examples

      iex> update_record(record, %{field: new_value})
      {:ok, %Record{}}

      iex> update_record(record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record(%Record{} = record, attrs) do
    record
    |> Record.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Record.

  ## Examples

      iex> delete_record(record)
      {:ok, %Record{}}

      iex> delete_record(record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record(%Record{} = record) do
    Repo.delete(record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record changes.

  ## Examples

      iex> change_record(record)
      %Ecto.Changeset{source: %Record{}}

  """
  def change_record(%Record{} = record) do
    Record.changeset(record, %{})
  end
end
