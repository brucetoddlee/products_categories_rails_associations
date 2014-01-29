products = []
products << Product.create(name: "toaster")
products << Product.create(name: "bike")
products << Product.create(name: "basketball")
products << Product.create(name: "wrench")
products << Product.create(name: "television")
products << Product.create(name: "spoon")
products << Product.create(name: "towel")
products << Product.create(name: "dog")

cats = []
cats << Cat.create(name: "kitchen")
cats << Cat.create(name: "appliance")
cats << Cat.create(name: "sports")
cats << Cat.create(name: "household")
cats << Cat.create(name: "on_sale")

cats[0].products << products[0]
cats[0].products << products[5]
cats[0].products << products[6]

cats[1].products << products[0]
cats[1].products << products[4]

cats[2].products << products[1]
cats[2].products << products[2]

cats[3].products << products[0]
cats[3].products << products[1]
cats[3].products << products[2]
cats[3].products << products[3]
cats[3].products << products[4]
cats[3].products << products[5]
cats[3].products << products[6]

cats[4].products << products[3]
cats[4].products << products[7]