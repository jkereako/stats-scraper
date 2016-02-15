json.array! @teams do |team|
  json.conference team.conference
  json.division team.division
  json.name team.name
end

