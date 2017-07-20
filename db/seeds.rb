Product.create!([
  {name: "Knicks Baby Outfit", price: "19.99", image: "http://www.babyfans.com/images/products/detail/KnicksTutuDress.jpg", description: "Outfit for a baby", stock: nil, supplier_id: 2},
  {name: "Knicks Team T-shirt", price: "24.99", image: "http://images.eastbay.com/pi/7UYG7NYK/zoom/adidas-nba-pre-game-t-shirt-mens", description: "The best fitting shirt. It just fits!", stock: nil, supplier_id: 2},
  {name: "Knicks Team Hat", price: "17.99", image: "http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2794000/ff_2794817_full.jpg&w=500", description: "This hat will make you play like Porzingod.", stock: nil, supplier_id: 1},
  {name: "Kristaps Porzingis", price: "179.99", image: "http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2164000/ff_2164737_full.jpg&w=500", description: "Authentic and rare original jersey. Goes up in value if he stays with the Knicks!", stock: nil, supplier_id: 1}
])
Supplier.create!([
  {name: "Nike", email: "coolnikeguy@nike.com", phone_number: "201-555-2454"},
  {name: "Adidas", email: "adidaslackey@adidas.com", phone_number: "312-555-3958"}
])
