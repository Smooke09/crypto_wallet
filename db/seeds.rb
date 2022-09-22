# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("Criando as moedas...")

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    img_url: "https://s2.coinmarketcap.com/static/img/coins/64x64/131.png"
)

puts("Moedas cadastradas com sucesso!")
