# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arg = Team.create(name: "ARGENTINA", status: :active)
aus = Team.create(name: "AUSTRIA", status: :active)
bel = Team.create(name: "BELGIUM", status: :active)
bra = Team.create(name: "BRAZIL", status: :active)
bul = Team.create(name: "BULGARIA", status: :active)
cam = Team.create(name: "CAMEROON", status: :active)
Team.create(name: "COLUMBIA", status: :active)
Team.create(name: "CROATIA", status: :active)
Team.create(name: "CZECH REPUBLIC", status: :active)
Team.create(name: "DENMARK", status: :active)
Team.create(name: "ENGLAND", status: :active)
Team.create(name: "FRANCE", status: :active)
Team.create(name: "GERMANY", status: :active)
Team.create(name: "GREECE", status: :active)
Team.create(name: "HOLLAND", status: :active)
Team.create(name: "IRELAND", status: :active)
Team.create(name: "ITALY", status: :active)
Team.create(name: "JAPAN", status: :active)
Team.create(name: "MEXICO", status: :active)
Team.create(name: "MOROCCO", status: :active)
Team.create(name: "NIGERIA", status: :active)
Team.create(name: "NORTHERN IRELAND", status: :active)
Team.create(name: "NORWAY", status: :active)
Team.create(name: "POLAND", status: :active)
Team.create(name: "PORTUGAL", status: :active)
Team.create(name: "ROMANIA", status: :active)


# Argentina players
Player.create(number: 12, name: "Pablo", status: :active, team_id: arg.id)
Player.create(number: 1, name: "Garcia", status: :active, team_id: arg.id)
Player.create(number: 6, name: "Alerto", status: :active, team_id: arg.id)
Player.create(number: 3, name: "Costa", status: :active, team_id: arg.id)
Player.create(number: 14, name: "Morelli", status: :active, team_id: arg.id)
Player.create(number: 13, name: "Basile", status: :active, team_id: arg.id)
Player.create(number: 4, name: "Domingo", status: :active, team_id: arg.id)

# Austria players
Player.create(number: 12, name: "Dreisky", status: :active, team_id: aus.id)
Player.create(number: 1, name: "L.Denk", status: :active, team_id: aus.id)
Player.create(number: 5, name: "E.Polts", status: :active, team_id: aus.id)
Player.create(number: 3, name: "H.Zacher", status: :active, team_id: aus.id)
Player.create(number: 14, name: "Schroth", status: :active, team_id: aus.id)
Player.create(number: 13, name: "H.Henze", status: :active, team_id: aus.id)
Player.create(number: 2, name: "Waldner", status: :active, team_id: aus.id)

# Belgium players
Player.create(number: 12, name: "Van Hert", status: :active, team_id: bel.id)
Player.create(number: 1, name: "Van Riet", status: :active, team_id: bel.id)
Player.create(number: 2, name: "Roche", status: :active, team_id: bel.id)
Player.create(number: 14, name: "Davries", status: :active, team_id: bel.id)
Player.create(number: 5, name: "Louis", status: :active, team_id: bel.id)
Player.create(number: 3, name: "Pesant", status: :active, team_id: bel.id)
Player.create(number: 13, name: "BoPart", status: :active, team_id: bel.id)

# Brazil players
Player.create(number: 12, name: "Sousa", status: :active, team_id: bra.id)
Player.create(number: 1, name: "da Silva", status: :active, team_id: bra.id)
Player.create(number: 3, name: "Paco", status: :active, team_id: bra.id)
Player.create(number: 13, name: "Marengez", status: :active, team_id: bra.id)
Player.create(number: 4, name: "Vincento", status: :active, team_id: bra.id)
Player.create(number: 6, name: "Ferreira", status: :active, team_id: bra.id)
Player.create(number: 2, name: "Cicero", status: :active, team_id: bra.id)

# Bulgaria players
Player.create(number: 12, name: "Saranov", status: :active, team_id: bul.id)
Player.create(number: 1, name: "Popov", status: :active, team_id: bul.id)
Player.create(number: 14, name: "Borsev", status: :active, team_id: bul.id)
Player.create(number: 2, name: "Simeonov", status: :active, team_id: bul.id)
Player.create(number: 5, name: "Botev", status: :active, team_id: bul.id)
Player.create(number: 3, name: "Dimitrov", status: :active, team_id: bul.id)
Player.create(number: 13, name: "Ivanov", status: :active, team_id: bul.id)

# Cameroon players
Player.create(number: 12, name: "Tchuli", status: :active, team_id: cam.id)
Player.create(number: 1, name: "Yephett", status: :active, team_id: cam.id)
Player.create(number: 14, name: "Ombe", status: :active, team_id: cam.id)
Player.create(number: 4, name: "Takanaki", status: :active, team_id: cam.id)
Player.create(number: 5, name: "Abombe", status: :active, team_id: cam.id)
Player.create(number: 2, name: "Kiwi", status: :active, team_id: cam.id)
Player.create(number: 13, name: "Ngawa", status: :active, team_id: cam.id)
