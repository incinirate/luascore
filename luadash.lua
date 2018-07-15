local doc_path = '/doc/' -- change this to /rom/something/
local topic = ((...) or 'index') .. '.txt'

-- terrible heuristic haha it'll catch typos
local function distance(s, t)
  local dist, s, t = 0, s:sub(1, -5), t:sub(1, -5)
  for i = 1, #t do
    if s:sub(i, i) ~= t:sub(i, i) then
      dist = dist + (#t - i)
    end
  end
  local sd = #s > #t and #s - #t or #t - #s
  return math.abs(dist + sd)
end

if fs.exists(doc_path .. topic) then
  local f = fs.open(doc_path .. topic, 'r')
  textutils.pagedPrint(f.readAll(), 16)
  f.close()
else
  printError('No documentation for ' .. topic)
  local list = fs.list(doc_path)
  print 'Did you mean one of:'
  for i = 1, #list do
    if distance(list[i], topic) < (#topic - 4) then
      print(' \183 ' .. list[i])
    end
  end
end
