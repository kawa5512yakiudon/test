
using Vega
using DataFrames
using DataStructures

df = readtable("c.txt", separator = '\t', header = false)
word, pos, lemma = df[1], df[2], df[3]
zipf = reverse(sort(unique(values(counter(word)))))
rank = [i for i = 1:length(zipf)]

lineplot(x = rank, y = zipf)
lineplot(x = map(log, rank), y = (log, zipf)

dft = unique(df[df])
d, ch = counter(df[1]), Dict()

word, pos, n = [], [], []
for i = 1:length(dft[1])
 haskey(ch, dft[1][i]) && continue
 d[dft[1][i]] < 200 && continue
 tmp, ch[dft[1][i]] = dft[dft[1][i] .== dft[1], :], 0
 length(unique(tmp[2])) < 2 && continue
 push!(word, tmp[1][1]); push!(pos, join(unique(tmp[2]),"*")); push!(n, d[dft[1][i]])
end

dfo = DataFrame(word = word, pos = pos, n = n)
sort!(dfo, cols = :n, rev = true)
writetable("pos.csv", dfo, separator = '\t')
