using TinySegmenter

""" knp_parser """
# json
@inline function knp_parser(sentence)
  run(pipeline(`echo $sentence`, `juman`, `knp -tab -anaphora`,".tmp"))
  res = readall(pipeline(`iconv -t UTF-8 .tmp`)); rm(".tmp")
  return split(replace(res, "\r", ""), "\n")[2:end-2]
end


""" juman_parser """
@inline function juman_parser(sentence)
  run(pipeline(`echo $sentence`, `juman`, ".tmp"))
  res = readall(pipeline(`iconv -t UTF-8 .tmp`)); rm(".tmp")
  return split(replace(res, "\r",""), "\n")[1:end-2]
end


""" mecab_parser """
@inline function mecab_parser(string)
  return parse(Mecab(), string)
end


""" word_segmentation """
@inline function word_segmentation(string)
  return tokenize(string)
end


""" readall(translate to UTF-8) """
function readall_utf8(filename)
  return readall(pipeline(`iconv -t UTF-8 $filename`))
end
