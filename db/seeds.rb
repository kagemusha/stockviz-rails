# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stock_cat = Category.find_or_create_by(name: 'stock')
re_cat = Category.find_or_create_by(name: 'real estate')
misc_cat = Category.find_or_create_by(name: 'misc')


#custom User_categories
#user_id, name
#unique for user_id,name

u1 = UserProfile.find_or_create_by(auth0_id: 'auth0|60984aeab743a9006a0a2bbe', screen_name: 'TestUser1')

swanX = 20
nmmMineY = 650
nmmGoodY = 140
nmmPosX = 350
nmmPosOffX = 200

u1_nmm_body = {
  symbol: 'NMM',
  name: 'Navios Maritime',
  theme: 'shipping',
  ticker: '31.80+1.92 (+6.43%)',
  price: 31.80,
  factors: [
    #good
    {id: 1, label: 'Buybacks', desc: '$13M buyback program', pos: {x: 160, y: 260}},
    {id: 2, label: 'P/E', desc: '2.3', pos: {x: nmmPosX, y: nmmGoodY}},
    {id: 3, label: 'Supply/Demand Imbalance', desc: 'big demand/supply mismatch', pos: {x: nmmPosX+nmmPosOffX , y: nmmGoodY}, positivity: 9},
    {id: 4, label: 'Rising Rates Link', link: 'baltic-link', periods: ['1d','1m', '1y'], pos: {x: nmmPosX+nmmPosOffX*3, y: nmmGoodY}, positivity: 9},
    #rising rates should be linked to something
    {id: 5, label: 'Moat till 2023', desc: 'newbuilds take time', pos: {x: nmmPosX+nmmPosOffX*2, y: nmmGoodY}, positivity: 9},
    #bad
    {id: 6, label: 'Governance', desc: 'GP structure favors expansion over shareholders', pos: {x: 450, y: nmmMineY}, positivity: -8},
    {id: 7, label: 'NNA', desc: 'Will they bail out NNA?', pos: {x: 800, y: nmmMineY}, positivity: -8},
    #swans
    {id: 8, label: 'Trade War', type: 'bswan', desc: 'US-China Trade War', pos: {x: swanX, y: 210}},
    {id: 10, label: 'Fraud', type: 'bswan', desc: 'remember DRYS', pos: {x: swanX, y: 270}},
    {id: 9, label: 'Takeover', type: 'wswan', desc: 'M&A picking up', pos: {x: swanX, y: 330}},
  ],
  events: [
    {label: '2q 2021 Earnings', date: '5/14/2021', position: {x: 30, y: 250}, mag:'major'},
    {label: 'Argos Recharter', date: '5/24/2021', position: {x: 70, y: 370}},
    {label: 'Shipping Conference', date: '6/24/2021', position: {x: 90, y: 490}}
  ],
  price_points: [
    {label: 'buyback', date: '11/29/2021', price: 2.1, position: {x: 530, y: 250}}
  ]
}

u1_tsla_body = {
  symbol: 'TSLA',
  name: 'Tesla',
  theme: 'auto',
  price: 729.40,
  ticker: '729.78+9.71 (+1.35%)',
  factors: [
    {id: 1, label: 'Battery Lead', desc: 'best battery factories', positivity: 6, pos: {x: 200, y: 150}},
    {id: 2, label: 'Innovation Culture', desc: 'Move faster than rivals', positivity: 8, pos: {x: 280, y: 290}},
    #bad
    {id: 3, label: 'Competition', desc: 'China, VW, Big 3 all ramping up EVs', positivity: -5, pos: {x: 1200, y: 550}},
    {id: 4, label: 'Valuation', desc: "PE > 1000!", positivity: -5, pos: {x: 980, y: 630}},
    #swans
    {id: 8, label: 'Elon dies', desc: "Musk's vision drives Tesla", type: 'bswan', pos: {x: swanX, y: 210}},
    {id: 10, label: 'Elon tweets', type: 'bswan', desc: 'SEC could get fed up with Musk tweets', pos: {x: swanX, y: 270}},
    {id: 9, label: 'Bitcoin > $1M', type: 'wswan', desc: 'Musk bets on bitcoin', pos: {x: swanX, y: 330}},
  ],
  events: [
    {label: '2q 2021 Earnings', date: '5/14/2021', position: {x: 30, y: 250}, mag:'major'},
    {label: 'Battery Day', date: '5/24/2021', position: {x: 70, y: 380}}
  ],
  price_points: [
    {label: 'secondary', date: '2/14/2020', price: 160.01, position: {x: 300, y: 150}},
    {label: '5:1 split', date: '8/31/2020', price: 442.68, position: {x: 500, y: 250}},
    {label: 'All-time high', date: '1/25/2021', price: 900.40, position: {x: 700, y: 150}}
  ]
}

u1.analyses.create!(category: stock_cat, topic: 'nmm', body: u1_nmm_body)
u1.analyses.create!(category: stock_cat, topic: 'tsla', body: u1_tsla_body)