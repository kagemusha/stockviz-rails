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

user1 = Profile.find_or_create_by(auth0_id: 'auth0|60984aeab743a9006a0a2bbe', screen_name: 'TestUser1')

swanX = 20
nmmMineY = 650
nmmGoodY = 140
nmmPosX = 350
nmmPosOffX = 200

nmm = {
  symbol: 'NMM',
  name: 'Navios Maritime',
  theme: 'shipping',
  category: stock_cat,
  factors: [
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
  ],
  events: [
    {label: '2q 2021 Earnings', edate: 3.weeks.from_now, magnitude: 3},
    {label: 'Argos Recharter', edate: 3.months.from_now, magnitude: 2},
    {label: 'Shipping Conference', edate: 2.months.from_now, magnitude: 1},
  ],
  pricepoints: [
    {label: 'buyback', date: 2.months.ago, price: 2.1}
  ]
}

tsla = {
  symbol: 'TSLA',
  name: 'Tesla',
  theme: 'auto',
  category: stock_cat,
  factors: [
    {label: 'Battery Lead', desc: 'best battery factories', positivity: 6, x: 200, y: 150},
    {label: 'Innovation Culture', desc: 'Move faster than rivals', positivity: 8, x: 280, y: 290},
    #bad
    {label: 'Competition', desc: 'China, VW, Big 3 all ramping up EVs', positivity: -5, x: 1200, y: 550},
    {label: 'Valuation', desc: "PE > 1000!", positivity: -5, x: 980, y: 630},
    #swans
    {label: 'Elon dies', desc: "Musk's vision drives Tesla", ftype: 'bswan', x: swanX, y: 210},
    {label: 'Elon tweets', ftype: 'bswan', desc: 'SEC could get fed up with Musk tweets', x: swanX, y: 270},
    {label: 'Bitcoin > $1M', ftype: 'wswan', desc: 'Musk bets on bitcoin', x: swanX, y: 330},
  ],
  events: [
    {label: '2q 2021 Earnings', edate: 2.weeks.from_now, magnitude: 2},
    {label: 'Battery Day', edate: 5.months.from_now, magnitude: 2},
  ],
  pricepoints: [
    {label: 'secondary', date: 1.months.ago, price: 160.01},
    {label: '5:1 split', date: 2.months.ago, price: 442.68},
    {label: 'All-time high', date: 3.months.ago, price: 900.40},
]
}

stocks = [nmm, tsla]
stocks.each do |stock|
  analysis = user1.analyses.find_or_create_by(category: stock[:category], topic: stock[:symbol])
  stock[:factors].each do |f|
    analysis.factors.create(f)
  end
  stock[:events].each do |ev|
    analysis.events.create(ev)
  end
  stock[:pricepoints].each do |pp|
    analysis.pricepoints.create(pp)
  end
end

