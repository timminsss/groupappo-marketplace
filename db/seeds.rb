# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'pry-byebug'
require "open-uri"
# CATEGORY_NAME = ["mountain bike", "road bike", "hybrid bike", "accessories"]
# PRODUCT_TYPE_NAME = %w[helmets shoes locks guards pumps stand straps lights]

# user = User.new(first_name: "first", last_name: "last", zip_code: "30678", email: "testeremail12356@outlook.com", password: "123456")
# # user.encrypted_password = '#$taawktljasktlw4aaglj'
# user.save!

# 100.times do
#   Product.create(user_id: 1, category: CATEGORY_NAME.sample, name: Faker::Name.name, description: Faker::Lorem.sentence, price: rand(50..100), image_url: "", product_type: PRODUCT_TYPE_NAME.sample)
# end
# Product::CATEGORY_NAME
# Creates 20 new users for the database

puts "Cleaning database"

User.destroy_all
ProductAssignment.destroy_all

owner = User.new(first_name: "Bruce", last_name: "Wayne", zip_code: 12345, email: "owner@example.com", password: "Pass1234")
owner.save

owner_2 = User.new(first_name: "john", last_name: "doe", zip_code: 12345, email: "owner2@example.com", password: "Pass1234")
owner.save

customer = User.new(first_name: "Ryan", last_name: "Boyd", zip_code: 12345, email: "mycatpepples@netscape.gu", password: "Pass1234")
customer.save

bikes = [
  {
    category: "mountain bike",
    name: "Rocky Mountain Instinct 2022 Alloy 50 Gold/Red",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/r/m/rmmt-22insa50gl-1.jpeg",
    description: "The DECOY is gravity-oriented, powerful, and fast. It’s a hard-hitting E-MTB with enough reserves for demanding Enduro missions. On the descents, it eats roots and rocks for breakfast, and thanks to the high-performance motor, you will enjoy this feeling on the uphill as well. More fun without the need for a shuttle, the DECOY in its mullet version (29 front, 27.5 rear wheel) is an airtime-loving weapon for all technical trails, whether downhill or uphill.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "mountain bike",
    name: "YT Tues Core 4 27 Carbon DH MTB Nox Blue",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/0/1/01_tues-27-core4-noxblue_front.jpg",
    description: "The DECOY 29 is a fast and powerful All Mountain E-MTB. Ready for any adventure, no matter where the trail leads. Thanks to the high-performance motor, you'll go for longer than ever before and experience an entirely new stoke from mountain biking. The DECOY 29 is a versatile All-Mountain E-Bike with genuine YT DNA.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "mountain bike",
    name: "Rocky Mountain Instinct 2022 Alloy 50 Gold/Red",
    image_url:  "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/y/t/yt-capra-29-core-2-alloy-mtb-black-magic-101318-par.jpg",
    description: "Whether its with a full-face helmet in the bike park, a half-shell somewhere above the tree line or with a number plate in the start gate, the goal is always the same: GOOD TIMES! When it was launched in 2014, the CAPRA changed the definition of the term Enduro with its outstanding performance at the races and in the bike park. The latest version of Enduros top dog has now become even lighter and stiffer. Additionally, the new CAPRA will impress both professionals and rookies alike thanks to a perfect mix of modern technology, state-of-the-art design, and incredible on-trail manners. The different wheel sizes and their individual characteristics were considered from the very beginning of the development, which led to the creation of two different frames, each tailor-made for their respective purposes.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "road bike",
    name: "Rocky Mountain Instinct 2022 Alloy 50 Gold Red",
    image_url:  "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/2/1/2110071104-par-1.jpeg",
    description: "The aerodynamic EnviLiv is designed with an Advanced-Grade Composite frame to be sharp and snappy, for a blazing-fast ride. Extraordinary lateral stiffness in the fork and unrivalled stopping power of aerodynamic disc brakes stack up for precise cornering control and stability. An integrated aero handlebar and stem, tubeless wheel system with 28c tyre clearance and aero tubing features will punch through rolling hills and slice through the wind.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "hybrid bike",
    name: "YT SZEPTER Core 3 Assault Green",
    image_url:  "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/y/t/yt_szepter_core3_assault_green_side.jpg",
    description: "The SZEPTER uproots all ideas of what a gravel bike should be. Leave your opinions at the door; this is the unruly sibling to gravel bikes of the past, built to redefine what is possible within the drop-bar genre. A tool with which to wield and rule over all terrain, the SZEPTER is gravel with a YT twist – reinvented for the modern-day gravity fiend. More than a reaction to what came before it, we saw this is an opportunity to do things differently. Gravel as it should be, and an exciting step outside our realm. Behind the front of drop bars and bartape, it has gravity in its genes. The SZEPTER defies convention, begging you to rise to an all-new challenge, explore uncharted terrain, and most importantly, LIVE UNCAGED.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "hybrid bike",
    name: "Open WI.DE. Enve Ltd Campagnolo Ekar Extra Small Complete Bike",
    image_url:  "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/O/P/OPEN_b28b.jpg",
    description: "The OPEN U.P. inspired a generation of gravel bikes that could fit up to 2.1 tyres. The WI.DE. (Winding Detours) can run even bigger tyres while still fitting road cranks! The monster tyres help you conquer the most extreme terrain; the performance geometry & narrow Q-factor keep you efficient while the steering geometry keeps you nimble. Nimble doesnt just mean great geometry, nimble means keeping the weight down too with Smartmount technology mounting the calipers directly without any adapters.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  },
  {
    category: "hybrid bike",
    name: "Focus Paralane 9.7 Cyclocross Bike Black Anthracite 2019",
    image_url:  "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/6/3/633728520-1.jpeg",
    description: "Light and agile and yet with the extra push of up to 25km/h from the Fazua Evation e-drive when support is needed: The removable motor/battery unit with 252Wh battery capacity is decoupled from the drive and only noticeable when you are driving relieved. If you want to ride completely without electric support, you can simply replace the Fazua motor (3.2kg) with a light cover.",
    price: rand(50..100),
    product_type: "bike",
    user: owner
  }
]
# bike_category_images = {
#   "mountain bike" => "https://d2yn9m4p3q9iyv.cloudfront.net/ghost/2020/sl-amr-4.7-al-u/thumbs/1000/d8151.jpeg",
#   "road bike" => "https://archiv.cube.eu/_next/image?url=%2Fmedia%2F2021%2F476410%2F476410_light.jpg&w=3840&q=100",
#   "hybrid bike" => "https://azwest1xfg344.blob.core.windows.net/azwesc1xfg346/thumbnail/9f/b5/8b/1667908877/S_0_60791_580055_S_00_1920x1920.jpg",
#   "accessories" => "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/l/e/leatt-enduro-3.0-mtb-helmet-black-l1021010740-par.jpg"
# }


helmets = [
  {
    user: owner,
    category: "accessories",
    product_type: "helmets",
    price: rand(1..100),
    name: "POC Otocon Full Face MTB Helmet Matte Lead Blue",
    description: "Exceptionally Lightweight And Well-Ventilated The ultimate in lightweight full-face protection, the new POC Otocon Full Face Helmet is a highly ventilated helmet made for the pressures of enduro. This ventilation design directs air through the helmet to help keep you comfortable whether racing downhill or giving full effort uphill. Features including a patented breakaway peak, the integrated Race Lock adjustment system and a dual-material liner with parts in multi-impact EPP, work together to extend protection and comfort for all kinds of riding. Removable cheek pads and a removable grill over the mouth give more flexibility to control ventilation, ideal while riding the climbing sections during long enduro races.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/p/o/poc-otocon-full-face-mtb-helmet-matte-lead-blue-pc105281589lrg1-par.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "helmets",
    price: rand(1..100),
    name: "Protect your face",
    description: "This helmet was designed to help you get scars but still have your life long goal as a face model. :)",
    image_url: "https://i.ebayimg.com/images/g/nC0AAOSwmLBg4sFy/s-l1600.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "helmets",
    price: rand(1..100),
    name: "Lazer Tonic MIPS Helmet Matte Blue/Black",
    description: "The Perfect Helmet For Those Just Getting Into Cycling The entry-level Lazer Tonic MIPS Helmet has the features you need for a solid helmet while aiming not to break the bank. The inconspicuous design of the helmet makes sure it is at home wherever you take it. An in-mould construction is used to keep the weight down while 28 vents make sure you are always cool and comfortable while riding. A dial at the back of the helmet controls a basket that secures a large part of the back of the head. A quick turn of the TS+ dial assures a snug yet comfortable fit that keeps the helmet firmly in place. Adjust it on the fly and start your cycling adventures.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/89c07179f890f72685d08a18c912682c/l/a/lazer-tonic-mips-helmet-matte-blue-black-bla2207888669-par.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "helmets",
    price: rand(1..100),
    name: "Lazer Sphere MIPS Helmet Blue Haze",
    description: "Comprehensive Road Helmet The Lazer Sphere Helmet with MIPS is your buddy on the road. The comfortable Advanced Rollsys system is combined with lightweight construction, eyewear docking and a well ventilated, aerodynamic design. There’s a 360-degree retention system, ensuring a perfect fit. The straps are slim, lightweight and adjustable, ensuring a comfortable and secure fit.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/l/a/lazer-sphere-mips-helmet-blue-haze-bla2227890772-par.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "helmets",
    price: rand(1..100),
    name: "Seven iDP Project 23 Fibreglass Full Face Helmet Blue/Black",
    description: "Project 23 Glass Fibre Helmet Whether you’re racing Enduro or DH, hitting it up at the bike park or enjoying your local trails, the Seven iDP Project 23 Fibreglass Helmet will keep you safe and protected. With a sturdy fibreglass shell for shock absorbency, combined with the new S.E.R.T. (Seven Energy Reduction Technology) energy management smart foam, the Project 23 Glass Fibre boasts safety and durability - all at an affordable price. And designed with 23 'big-bore' vents, this full-face helmet is ensured to keep you cool and comfortable with through-flow ventilation. Who knew just how good safety could look.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/89c07179f890f72685d08a18c912682c/s/e/seven-idp-project-23-glass-fibre-helmet-blue-black-7711-03-520-par.jpg"
  }
]
shoes = [
  {
    user: owner,
    category: "accessories",
    product_type: "shoes",
    price: rand(1..100),
    name: "Adidas Ultraboost 22 Womens Running Shoes Black / White / Yellow US7",
    description: "With the help of 1.2 million foot scans, we updated Ultraboost with a complete 360° female fit improvement. And we didn't stop there. We re-engineered the rubber outsole. We tested hundreds of prototypes. We kept going until we saw visible improvements in performance. The result? 4% more forefoot energy return, compared to Ultraboost 21 for women. The adidas PRIMEKNIT upper includes a narrower heel fit, designed to avoid heel slip and blisters. You'll be riding on a BOOST midsole with a Linear Energy Push system. The shoe's upper is made with yarn containing 50% Parley Ocean Plastic —  reimagined plastic waste, intercepted on remote islands, beaches, coastal communities and shorelines, preventing it from polluting our ocean.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/G/X/GX6658_1_521d.jpeg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "shoes",
    price: rand(1..100),
    name: "Adidas Ultraboost 22 Womens Running Shoes Black / Black / White US9.5",
    description: "With the help of 1.2 million foot scans, we updated Ultraboost with a complete 360° female fit improvement. And we didn't stop there. We re-engineered the rubber outsole. We tested hundreds of prototypes. We kept going until we saw visible improvements in performance. The result? 4% more forefoot energy return, compared to Ultraboost 21 for women. The adidas PRIMEKNIT upper includes a narrower heel fit, designed to avoid heel slip and blisters. You'll be riding on a BOOST midsole with a Linear Energy Push system. The shoe's upper is made with yarn containing 50% Parley Ocean Plastic —  reimagined plastic waste, intercepted on remote islands, beaches, coastal communities and shorelines, preventing it from polluting our ocean.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/G/X/GX5591_1_92eb.jpeg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "shoes",
    price: rand(1..100),
    name: "Mons Royale Unisex Atlas Merino Ankle Sock Black",
    description: "Wear a black sock. Your feet might get dirty but no one will know.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/1/0/100647_1169_001_1_162d.jpeg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "shoes",
    price: rand(1..100),
    name: "Adidas Womens Earthlight Stella McCartney Shoes White/Black/Yellow Size US7",
    description: "Mesh running shoes for city running and everyday weadFind your stride in the adidas by Stella McCartney Earthlight running shoes. Don't be fooled by the stylish design and sophisticated details. This shoe is designed for city running as much as everyday wear. Take these mesh shoes out for a 10 km run, and you won't be disappointed. The partially recycled EVA midsole cushions your entire foot and to return your energy with every step. Even the mesh details on the upper shoe are as much for function as style. Made in part with Primeblue recycled materials, they keep the air flowing through and your feet feeling cool.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/A/d/Adidas_Womens_Earthlight_Stella_McCartney_c5db.jpg"
  }
]
locks = [
  {
    user: owner,
    category: "accessories",
    product_type: "locks",
    price: rand(1..100),
    name: "Abus Ultra 410 U-Bolt 230 x 12mm Bike Lock + SH34 Bracket Green",
    description: "Abus Ultra 410 U-Bolt Lock Secures Bikes Against Theft The second most important thing you can do to prevent the theft of your bicycle is to lock it to as strong and as solid an object as you can find with the best lock you can afford. And that's where the ABUS U-BOLT ULTRA 410 BIKE LOCK comes in to save the day.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/a/b/abus-ultra-410-u-bolt-230x12mm-bike-lock-sh34-green-ax34591.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "locks",
    price: rand(1..100),
    name: "Lock IT",
    description: "Put this around your bike they will steal it first.",
    image_url: "https://i.etsystatic.com/5395361/r/il/f22821/1118367255/il_fullxfull.1118367255_k17t.jpg"
  }
]
guards = [
  {
    user: owner,
    category: "accessories",
    product_type: "guards",
    price: rand(1..100),
    name: "Fox Mud Guard",
    description: "Protect You and Your Bike This proven mudguard design has evolved with subtle improvements and refinements made over the last decade and is more popular than ever. Available in a variety of colourways, widely used and endorsed by Weekend Warriors, Pro Downhill and Enduro riders around the world! Stops mud, gravel, grit and twigs being flung into your face. Your fork stanchions, seals and bridge are protected from getting caked, reducing the need for cleaning and servicing.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/f/o/fox-mud-guard-black-black-fo25665021os_1.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "guards",
    price: rand(1..100),
    name: "IXS Carve EVO+ Elbow Guards Grey",
    description: "The Carve models manage without hard shells and are therefore light and extremely comfortable to wear. They are ideal for somewhat harder use and, with the integrated XmatterTM padding concept provide high impact absorption and protection. With the Carve Evo+ we introduce product properties like exchangeable padding, structurally improved AeroMeshTM of newest generation offering a higher level of comfort and structural strength. ",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/i/x/ixs-carve-evoplus-elbow-guards-grey-IXS-482-510-6614-009-PAR.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "guards",
    price: rand(1..100),
    name: "WOS Hockey Goalie Kit Large",
    description: "Quality foam large goalie kit complete for use immediately. Kit includes helmet and mask, throat protector, body armour, padded shorts, groin protector, leg guards, kickers, hand protectors and an extra large kit bag for easy storage.",
    image_url: "https://d4iqe7beda780.cloudfront.net/resources/static/main/image/ws469972.jpg"
  },
]
pumps = [
  {
    user: owner,
    category: "accessories",
    product_type: "pumps",
    price: rand(1..100),
    name: "Pedros Prestige Floor Pump",
    description: "Innovation in the Art of Bicycle Mechanics Pedro's bicycle tool line-up offers true innovations that enhance the art of bicycle mechanics. Pedro’s focus on quality and innovation means their tools are constructed employing the absolute best materials and manufacturing techniques available; providing ease of use, superior performance and quality, backed with the unmatched Pedro’s lifetime warranty. Pedro’s believe the right tools lead to better rides, safer rides, and more fun on every ride. Enjoy the ride.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/p/e/pedros-prestige-floor-pump-6450500.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "pumps",
    price: rand(1..100),
    name: "Azur SP45 Floor Pump Black/Blue",
    description: " 160 psi /11 bar • Durable steel barrel • Ergo plastic handle • Large easy to read gaug",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/a/z/azur-sp45-floor-pump-black-blue-AAFPDHBKBL-gauge.jpg"
  }
]
stand = [
  {
    user: owner,
    category: "accessories",
    product_type: "stand",
    price: rand(1..100),
    name: "Steadyrack Wall Mounted Folding Bike Rack Black",
    description: "If your bike is your pride and joy, then don't even think of spending money on a regular bike storage hook. In fact, after you've considered the features and advantages of the Steadyrack Classic, you'll know exactly why you're going to buy it and why it is absolutely worth the extra investment. The Australian designed & engineered Steadyrack Classic, with its’ unique design, provides a steadfast solution to the storage of your prized possession off the floor, without straining your back when loading and unloading making it perfect for home garages, sheds, workplaces, apartments and offices. In fact it will suit almost any situation or location and is the ideal storage solution for the majority of bicycles and wheel sizes. The unique swivel action gives you the option of leaving your bicycle in the central position or swivelling the rack to the left or right as the need arises. Storing a number of bicycles side-by-side is no problem at all and for families and businesses alike it will be the happy solution to their bike parking woes. To deter thieves the bike can be locked into the rack using quality bike locks and once the bikes are up on the wall. Installation is a breeze with the comprehensive instructions supplied.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/s/t/steadyrack-wall-mounted-folding-bike-rack-black-142416.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "stand",
    price: rand(1..100),
    name: "Vulcan Repair Stand",
    description: "Vulcan Home Mechanic Repair Stand is a great home work stand that is both stable and height adjustable. It folds for easy assembly and has a multipurpose tool tray which is great for keeping the essential tools close at hand. And with the rotating mechanism your bike can be positioned in any number of way.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/v/r/vrs.jpg"
  }
]
straps = [
  {
    user: owner,
    category: "accessories",
    product_type: "straps",
    price: rand(1..100),
    name: "Garmin HRM-Pro Wireless Strap and Sensor",
    description: "Heart Rate the Easy, Accurate Way This premium heart rate strap transmits real-time heart rate data over ANT+® connectivity and BLUETOOTH® Low Energy technology, giving you more training options. Consistently receive accurate heart rate on your Garmin device, in online training apps such as Zwift or even the compatible fitness equipment at the gym.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/g/a/garmin-hrm-pro-wireless-strap-and-sensor-010-12955-00.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "straps",
    price: rand(1..100),
    name: "Garmin HRM Dual Strap & Sensor",
    description: "Accurate and real-time heart rate However you like to train, you'll get the accurate, real-time heart rate you need to take your performance to the next level. This Garmin HRM Dual Strap and Sensor transmits real-time heart rate data over ANT+ connectivity and BLUETOOTH Low Energy technology, giving you more options to train indoors, outdoors or even online. With it you'll be able to consistently receive accurate heart rate on your Garmin device, in online training apps such as Zwift or even the compatible fitness equipment in your favourite class at the gym.",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/g/a/garmin-hrm-dual-strap-and-sensor-010-12883-00.jpg"
  }
]
lights = [
  {
    user: owner,
    category: "accessories",
    product_type: "lights",
    price: rand(1..100),
    name: "Azur 1K 1000lm USB Front Light Black",
    description: "You don't have to be a Pro to use the Azur 1K Front Light but with 1000 Lumens under the hood you'll most certainly look like one. Here in Australia our road rules require bike riders to be visible at 200 metres through the employment of a front white and rear red light when riding in low light conditions. This is because other road users need to be able to see riders, and lights are the most effective visibility tool. However, while this is a minimum requirement many bike lights can make you stand out a lot more than that - like the Azur 1K for example. It really packs a big punch! It will not only ensure you are unmistakeably visible to others but will also make the road ahead of you fully visible for spotting potential hazards in your path. You would be well advised however to angle this light down to focus at a point ten metres ahead of the bike to avoid the risk of blinding ",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/a/z/azur-1k-1000lm-usb-front-light-black-AL1KHL-built-in-lithium-battery.jpg"
  },
  {
    user: owner,
    category: "accessories",
    product_type: "lights",
    price: rand(1..100),
    name: "Garmin Varia RTL515 Rear View Radar w/ Tail Light",
    description: "Stay Aware of Approaching Cars Garmin’s Varia radar systems provide audible and visible warnings to alert the rider to any fast-approaching vehicles. With a Varia app that allows any smartphone to be utilised as the head unit, functioning as the Varia display of course the new systems are also compatible with existing Garmin devices with Varia capabilities. ",
    image_url: "https://www.pushys.com.au/media/catalog/product/cache/5ac4e4ad447fecc0a8694a493d78cc80/g/a/garmin-varia-rtl515-rear-radar-tail-light-010-02375-00.jpg"
  }
]

bikes.each do |bike|
  puts bike
end

puts "Users created"
PRODUCT_TYPE_NAME = %w[bike helmets shoes locks guards pumps stand straps lights]
bikes.each do |bike|
  file = URI.open(bike[:image_url])
  product = Product.new(bike)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
helmets.each do |helmet|
  file = URI.open(helmet[:image_url])
  product = Product.new(helmet)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
shoes.each do |shoe|
  file = URI.open(shoe[:image_url])
  product = Product.new(shoe)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
locks.each do |lock|
  file = URI.open(lock[:image_url])
  product = Product.new(lock)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
guards.each do |guard|
  file = URI.open(guard[:image_url])
  product = Product.new(guard)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
pumps.each do |pump|
  file = URI.open(pump[:image_url])
  product = Product.new(pump)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
stand.each do |stan|
  file = URI.open(stan[:image_url])
  product = Product.new(stan)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
straps.each do |strap|
  file = URI.open(strap[:image_url])
  product = Product.new(strap)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
lights.each do |light|
  file = URI.open(light[:image_url])
  product = Product.new(light)
  product.photo.attach(io: file, filename: "image", content_type: "image")
  product.save
  puts "#{Product.last.id}"
end
