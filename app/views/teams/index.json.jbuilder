json.array!(@teams) do |team|
  json.extract! team, :id, :name, :constructor, :podiums, :driver1, :driver2, :titles, :livery
  json.url team_url(team, format: :json)
end
