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

u1 = Profile.find_or_create_by(auth0_id: 'auth0|60984aeab743a9006a0a2bbe', screen_name: 'TestUser1')

swanX = 20
nmmMineY = 650
nmmGoodY = 140
nmmPosX = 350
nmmPosOffX = 200

nmm = {
  symbol: 'NMM',
  name: 'Navios Maritime',
  theme: 'shipping',
}

nmm_factors = [
    #good
    {label: 'Buybacks', desc: '$13M buyback program', x: 160, y: 260},
    {label: 'P/E', desc: '2.3', x: nmmPosX, y: nmmGoodY},
    {label: 'Supply/Demand Imbalance', desc: 'big demand/supply mismatch', x: nmmPosX+nmmPosOffX , y: nmmGoodY, positivity: 9},
    {label: 'Rising Rates Link', x: nmmPosX+nmmPosOffX*3, y: nmmGoodY, positivity: 9},
    #rising rates should be linked to something
    {label: 'Moat till 2023', desc: 'newbuilds take time', x: nmmPosX+nmmPosOffX*2, y: nmmGoodY, positivity: 9},
    #bad
    {label: 'Governance', desc: 'GP structure favors expansion over shareholders', x: 450, y: nmmMineY, positivity: -8},
    {label: 'NNA', desc: 'Will they bail out NNA?', x: 800, y: nmmMineY, positivity: -8},
    #swans
    {label: 'Trade War', ftype: 'bswan', desc: 'US-China Trade War', x: swanX, y: 210},
    {label: 'Fraud', ftype: 'bswan', desc: 'remember DRYS', x: swanX, y: 270},
    {label: 'Takeover', ftype: 'wswan', desc: 'M&A picking up', x: swanX, y: 330},
  ]

  nmm_events = [
    {label: '2q 2021 Earnings', date: '5/14/2021', x: 30, y: 250, mag:'major'},
    {label: 'Argos Recharter', date: '5/24/2021', x: 70, y: 370},
    {label: 'Shipping Conference', date: '6/24/2021', x: 90, y: 490}
  ]

  nmm_price_points = [
    {label: 'buyback', date: '11/29/2021', price: 2.1, x: 530, y: 250}
  ]

tsla = {
  symbol: 'TSLA',
  name: 'Tesla',
  theme: 'auto',
}

tsla_factors = [
    {label: 'Battery Lead', desc: 'best battery factories', positivity: 6, x: 200, y: 150},
    {label: 'Innovation Culture', desc: 'Move faster than rivals', positivity: 8, x: 280, y: 290},
    #bad
    {label: 'Competition', desc: 'China, VW, Big 3 all ramping up EVs', positivity: -5, x: 1200, y: 550},
    {label: 'Valuation', desc: "PE > 1000!", positivity: -5, x: 980, y: 630},
    #swans
    {label: 'Elon dies', desc: "Musk's vision drives Tesla", ftype: 'bswan', x: swanX, y: 210},
    {label: 'Elon tweets', ftype: 'bswan', desc: 'SEC could get fed up with Musk tweets', x: swanX, y: 270},
    {label: 'Bitcoin > $1M', ftype: 'wswan', desc: 'Musk bets on bitcoin', x: swanX, y: 330},
]

tsla_events = [
    {label: '2q 2021 Earnings', date: '5/14/2021', x: 30, y: 250, mag:'major'},
    {label: 'Battery Day', date: '5/24/2021', x: 70, y: 380}
]

tsla_price_points = [
    {label: 'secondary', date: '2/14/2020', price: 160.01, x: 300, y: 150},
    {label: '5:1 split', date: '8/31/2020', price: 442.68, x: 500, y: 250},
    {label: 'All-time high', date: '1/25/2021', price: 900.40, x: 700, y: 150}
]

nmm_analysis = u1.analyses.find_or_create_by(category: stock_cat, topic: 'nmm')
nmm_factors.each do |f|
  nmm_analysis.factors.create(f)
end

tsla_analysis = u1.analyses.find_or_create_by(category: stock_cat, topic: 'tsla')
tsla_factors.each do |f|
  tsla_analysis.factors.create(f)
end