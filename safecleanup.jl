using Pkg
Pkg.add("JSON")
Pkg.add("DataFrames")
Pkg.add("CSV")
using JSON
using DataFrames
using CSV

for file in readdir()
    if endswith(file, ".json")
        f = JSON.parse(read(open(file, "r"), String))
        df = DataFrame(f[1])
            for dict in f[2:end]
                push!(df, dict)
            end
        println(df)
        name = replace(file, r".json" => s".csv")
        CSV.write(name, df)
    end
end    