defmodule NucCountBench do
  @nucleotides 'ACGT'
  @empty Map.new(@nucleotides, &{&1, 0})
  
  def single(strand) do
    @nucleotides
    |> Enum.map(&{&1, count(strand, &1)})
    |> Map.new
  end
  
  def multi(strand) do
    Enum.reduce(strand, @empty, &Map.update(&2, &1, 1, fn x -> x + 1 end))
  end

  defp count(strand, elem), do: Enum.count(strand, &(&1 == elem))
end
