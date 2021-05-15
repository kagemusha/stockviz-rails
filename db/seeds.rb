# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
stock_cat = Category.create(name: 'stock')
Category.create(name: 'real estate')

u1 = UserProfile.create(auth0_id: 'auth0|60984aeab743a9006a0a2bbe')
stock_anl = JSON.parse('{"topic": "NMM"}')
u1.analyses.create(category: stock_cat, body: stock_anl)

