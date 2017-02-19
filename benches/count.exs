import IO.ANSI, only: [red: 0, reset: 0]

IO.puts [red(), "Preparing data", reset()]

small_sample = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
large_sample = small_sample |> Stream.cycle |> Enum.take(20_000_000)

IO.puts [red(), "Running the Benchmark", reset()]

Benchee.run(%{
  "single_iteration" => fn -> NucCountBench.single(large_sample) end,
  "multi_iteration" => fn -> NucCountBench.multi(large_sample) end,
}, time: 10)