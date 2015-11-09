User.create!([
  {username: "robbie", password: 'password', role: 1},
  {username: "peter", password: 'password', role: 0}
])
Category.create!([
  {name: "Code"},
  {name: "Ruby"},
  {name: "Rails"},
  {name: "Something"},
  {name: "blah"}
])
Image.create!([
  {name: "Sunset", link: "http://robbielane.net/works/sandybeach/photos/SandyBeech1.jpg"},
  {name: "iceland", link: "http://robbielane.net/works/iceland/photos/Iceland3.jpg"},
  {name: "ice cave", link: "http://robbielane.net/works/icecave/photos/IceCave1.jpg"},
  {name: "Sunflower", link: "http://robbielane.net/prints/OneOfMany/OneOfMany.jpg"},
  {name: "Columbia River", link: "http://robbielane.net/prints/ColumbiaGorge/ColumbiaGorge.jpg"},
  {name: "Haines", link: "http://robbielane.net/works/haines/photos/HainesTananiPoint.jpg"}
])
Idea.create!([
  {title: "New Idea", body: "Shabby chic photo booth microdosing master cleanse chambray organic. You probably haven't heard of them VHS shabby chic, hashtag pickled tacos tattooed plaid bitters flannel irony. ", user_id: 1, category_id: 2},
  {title: "Another Idea", body: "Salvia mlkshk viral, cred keytar yr readymade pabst selvage polaroid VHS flannel health goth disrupt. VHS etsy small batch, cred yuccie polaroid sriracha distillery you probably haven't heard of them raw denim fixie. Leggings quinoa kogi, umami humblebrag banjo sartorial listicle church-key banh mi typewriter.", user_id: 1, category_id: 3},
  {title: "Super Idea", body: "Tilde craft beer mustache kogi helvetica tacos, direct trade sartorial yr vinyl vice. Asymmetrical forage hella chicharrones gentrify, distillery squid truffaut keffiyeh scenester PBR&B whatever hashtag slow-carb sustainable. Tattooed beard mlkshk flexitarian.", user_id: 1, category_id: 3},
  {title: "Brilliant Idea", body: "Retro cray occupy, direct trade farm-to-table cronut cornhole kombucha tilde trust fund photo booth. Cronut kogi beard mlkshk, jean shorts +1 selvage single-origin coffee thundercats normcore butcher mixtape brooklyn pickled literally. Venmo chia migas, brunch XOXO knausgaard truffaut etsy vegan letterpress master cleanse aesthetic. Shoreditch mustache mixtape godard, pug helvetica small batch cornhole locavore portland chillwave neutra beard organic.", user_id: 1, category_id: 1},

])
IdeasImage.create!([
  {image_id: 3, idea_id: 4},
  {image_id: 4, idea_id: 4},
  {image_id: 5, idea_id: 2},
  {image_id: 6, idea_id: 1},
  {image_id: 2, idea_id: 2},
  {image_id: 1, idea_id: 4},
  {image_id: 1, idea_id: 4}
])
