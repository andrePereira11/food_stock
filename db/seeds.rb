# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#ProductType.create(name:'I do not know', description:'')
#Vegetais - brócolis, couve, repolho, abobrinha
ProductType.create(name:'Vegetables', description:'Some foods in this group are: broccoli, cabbage, zucchini, etc.')
#Frutas - abacaxi, maçã, banana, kiwi, caju, acerola
ProductType.create(name:'Fruits', description:'Some examples of fruit are: pineapple, apple, banana, kiwi, cashew, acerola, etc.')
#Leites e derivados - queijo, leite, iogurtes
ProductType.create(name:'Milk and dairy products', description:'The main foods in this group are: cheese, milk, yogurt, etc.')
ProductType.create(name:'Meat and eggs', description:'The main foods in this group are: fish, chicken, meat, eggs, etc.')
#Legumes e leguminosas - feijão, soja, lentilha, grão de bico, castanhas
ProductType.create(name:'Legumes and oilseeds', description:'This group comprises: beans, soybeans, lentils, chickpeas, chestnuts etc.')
#oleos e gorduras - azeite, manteiga, óleo de soja
ProductType.create(name:'Oil and fat', description:'The foods in this group are: olive oil, butter, soy oil, etc.')
#Açucares e doces - açúcar, mel, chocolate, sorvete, bolo
ProductType.create(name:'Sugar and candies', description:'The foods that make up this group are: sugar, honey, chocolate, ice cream, cake, etc.')
ProductType.create(name:'Cleaning products', description:'The products that make up this group are: detergent, soap, toothbrush, etc.')

ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')