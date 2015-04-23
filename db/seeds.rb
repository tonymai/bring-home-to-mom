# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
interests = ["3D printing", "Acting", "Baton twirling", "Board games", "Calligraphy", "Candle making", "Computer programming", "Cooking", "Coloring", "Cosplaying", "Couponing", "Creative writing", "Crocheting", "Cryptography", "Dance", "Digital arts", "Drama", "Drawing", "Do it yourself", "Electronics", "Embroidery", "Flower arranging", "Foreign language learning", "Gaming", "Gambling", "Genealogy", "Glassblowing", "Homebrewing", "Ice skating", "Jewelry making", "Jigsaw puzzles", "Juggling", "Knapping", "Knitting", "Kabaddi", "Knife making", "Lacemaking", "Lapidary", "Leather crafting", "Lego building", "Machining", "Macrame", "Magic", "Model building", "Listening to music", "Origami", "Painting", "Playing musical instruments", "Pottery", "Puzzles", "Quilting", "Reading", "Scrapbooking", "Sculpting", "Sewing", "Singing", "Sketching", "Soapmaking", "Sports", "Standup comedy", "Sudoku", "Table tennis", "Taxidermy", "Video gaming", "Watching movies", "Web surfing", "Wood carving", "Woodworking", "Worldbuilding", "Writing", "Yoga", "Yo-yoing"]

interests.map! do |interest|
  new_interest = Interest.create(name: interest.titleize)
end

values = ["Accountability", "Adventurousness", "Altruism", "Ambition", "Assertiveness", "Balance", "Commitment", "Community", "Compassion", "Competitiveness", "Contentment", "Cooperation", "Courtesy", "Creativity", "Curiosity", "Devoutness", "Diligence", "Discipline", "Diversity", "Elegance", "Empathy", "Equality", "Fairness", "Faith", "Family", "Fidelity", "Fitness", "Freedom", "Generosity", "Grace", "Happiness", "Hard Work", "Health", "Holiness", "Honesty", "Honor", "Humility", "Independence", "Intelligence", "Justice", "Leadership", "Love", "Loyalty", "Marriage", "Obedience", "Openness", "Originality", "Patriotism", "Peace", "Perfection", "Piety", "Positivity", "Reliability", "Selflessness", "Self-reliance", "Sensitivity", "Service", "Success", "Support", "Teamwork", "Timeliness", "Tolerance", "Traditionalism", "Truth", "Unity"]

values.map! do |value|
  new_value = Value.create(name: value.titleize)
end

cities = ['San Francisco', 'San Diego', 'Los Angeles', 'Santa Barbara', 'Sacramento']

experience_photos = ['http://www.seamless.com/finedining/img/vendormenuplustabcontentimages/lg_27331_0.jpg', 'http://25.media.tumblr.com/8de69d887367fa0ea41ba1c628fcad9f/tumblr_myvf7h7dKh1shjq15o1_1280.jpg', 'http://collegetimes.com/wp-content/uploads/2014/09/las.jpg', 'http://www.toastedontheinside.com/wp-content/uploads/2013/11/foodporn-34.jpg', 'http://nolavie.com/wp-content/uploads/2014/02/Pork-sliders-2.jpg', 'http://i.imgur.com/iPjkzUz.jpg', 'http://loreleynyc.com/gallery/photos/Food/beer_tasting_flight.jpg', 'https://img.vimbly.com/images/full_photos/scotch-1.jpg']

movie_posters = ['http://www.cinemablend.com/images/news/67907/_1414454351.jpg']

dbc_students =
  [ ['Andrew', 'Dye', 'https://secure.gravatar.com/avatar/5abc8c1476e25191a08feba0a23f3829.png?r=PG&amp;d=mm&amp;s=300'],
    ['Anna', 'MacDonald', 'https://secure.gravatar.com/avatar/99659b959801d235a8a7c213227008f9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Dixon', 'Adair', 'https://secure.gravatar.com/avatar/a8936e98d319c6c8dad202d692aba2d1.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Bao', 'Tran', 'https://secure.gravatar.com/avatar/f038deaeb508bed3d78f624ca1028df9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Curtis', 'Seaton', 'https://secure.gravatar.com/avatar/e74d3dcf95f680e762f88b3909f35f9f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Danny', 'Lundy', 'https://secure.gravatar.com/avatar/ebed9794eb1db20cfbb0a63fc4d76bb9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Deb', 'Wolfe', 'https://secure.gravatar.com/avatar/716c42ca68efd84a82e58a624f809b80.png?r=PG&amp;d=mm&amp;s=300'],
    ['Erin', 'Hyejin Kim', 'https://secure.gravatar.com/avatar/bc3161cfe66e944b2b207080149a2df4.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ganesh', 'Balaji', 'https://secure.gravatar.com/avatar/ac871ebaa0628c6a83289e7c564af480.png?r=PG&amp;d=mm&amp;s=300'],
    ['Iulia', 'Soimaru', 'https://secure.gravatar.com/avatar/3d772ac9d054192808f55fac90a867c7.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jacqueline', 'Hernandez', 'https://secure.gravatar.com/avatar/9e75c8c3c4d507fb24ec1bd0239ed2d7.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Janet', 'Brown', 'https://secure.gravatar.com/avatar/13de1fc4c41fb6214c540b2bd3aa256f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jeremy', 'Gagon', 'https://secure.gravatar.com/avatar/8a6027df29e3339dbe9e9cfa314c90ec.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jonathan', 'Berk', 'https://secure.gravatar.com/avatar/3c962b80bfae0ff8e61b99ba032c89c2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Kailash', 'Duraiswami', 'https://secure.gravatar.com/avatar/d71b25f17864f11928c53639eefa8bc4.png?r=PG&amp;d=mm&amp;s=]300'],
    ['Kevin', 'Ceballos', 'https://secure.gravatar.com/avatar/1475db0bc23485196d4cfb94e9c4a104.png?r=PG&amp;d=mm&amp;s=300'],
    ['Marko', 'Anton Potocnik', 'https://secure.gravatar.com/avatar/793240f33e505ec0af147eaefd94e628.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Matt', 'McDole', 'https://secure.gravatar.com/avatar/663dd748230392e54aec7879301dcac8.png?r=PG&amp;d=mm&amp;s=300'],
    ['Matthew', 'Lao', 'https://secure.gravatar.com/avatar/70a39a576cbafe46e62db83814105b3a.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Perez', 'https://secure.gravatar.com/avatar/abce251b8018346e771560d66db2b3a3.png?r=PG&amp;d=mm&amp;s=300'],
    ['Mikhail', 'Delos Trinos', 'https://secure.gravatar.com/avatar/80d04fcd03aeb5df3395e79594bc4143.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Peter', 'Brown', 'https://secure.gravatar.com/avatar/c6186e147a341a37f30e9ab54c8538ff.png?r=PG&amp;d=mm&amp;s=300'],
    ['Sofie', 'Garden', 'https://secure.gravatar.com/avatar/d42a49d8478e2cb45d41d04daa7ba9ee.png?r=PG&amp;d=mm&amp;s=300'],
    ['Stephanie', 'Lopez', 'https://secure.gravatar.com/avatar/62d0db03a04b24643e728391acac88ef.png?r=PG&amp;d=mm&amp;s=300'],
    ['Tony', 'Mai', 'https://secure.gravatar.com/avatar/0c45b9639c78f8a63b36f203c9079443.png?r=PG&amp;d=mm&amp;s=300'],
    ['Angel', 'Baek', 'https://secure.gravatar.com/avatar/fd5875e58b471403e7ef989c1f279c8f.png?r=PG&d=mm&s=300'],
    ['Benjamin', 'Cheng', 'https://secure.gravatar.com/avatar/300afa0d3001cac8d34e275bc4bda47bab.png?r=PG&amp;d=mm&amp;s=300'],
    ['Eveanandi', 'Butler', 'https://secure.gravatar.com/avatar/19e84bce904297a64660ed7ccf0e491c.png?r=PG&amp;d=mm&amp;s=300'],
    ['Hoa', 'Nguyen', 'https://secure.gravatar.com/avatar/1072b6ea7500f01b211b613cbc829ea8.png?r=PG&amp;d=mm&amp;s=300'],
    ['Kevin', 'Alwell', 'https://secure.gravatar.com/avatar/1ea12a054cb7f8b73de8462e587fa03b.png?r=PG&amp;d=mm&amp;s=300'],
    ['Kiran', 'Chitraju', 'https://secure.gravatar.com/avatar/4181791ecdc31a4c410b3685e5c1fa17.png?r=PG&amp;d=mm&amp;s=300'],
    ['Lauren', 'Nicole Roth', 'https://secure.gravatar.com/avatar/5c6640f1054e938720e6e5561c28e1fd.png?r=PG&amp;d=mm&amp;s=300'],
    ['Malcolm', 'Bouzi', 'https://secure.gravatar.com/avatar/770485a558be33758a8e45b888020f86.png?r=PG&amp;d=mm&amp;s=300'],
    ['Natalia', 'Bryzhatenko', 'https://secure.gravatar.com/avatar/e0be7df54a0a9f8b8de76734d2c063000.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ryan', 'Blecher', 'https://secure.gravatar.com/avatar/e83a2a7ca73d42d8c9f0005c11a231c1.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ryan', 'Immesberger', 'https://secure.gravatar.com/avatar/3afba1b3009a188248dc32446efd05150.png?r=PG&amp;d=mm&amp;s=300'],
    ['Samantha', 'Guergenenov', 'https://secure.gravatar.com/avatar/e97448e2a7d88c3574567ef4fb763f94.png?r=PG&amp;d=mm&amp;s=300'],
    ['Stephanie', 'Lo', 'https://secure.gravatar.com/avatar/23deb16828cb33d94ba50e61bdf941c2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Tracy', 'Teague', 'https://secure.gravatar.com/avatar/681e9ae0e7b0a0c96e1943ebcfab2cc6.png?r=PG&amp;d=mm&amp;s=300'],
    ['Chase', 'Nutile', 'https://secure.gravatar.com/avatar/c6b4619640b4d2515a22adb62f40ade7.png?r=PG&amp;d=mm&amp;s=300'],
    ['Chris', 'Lintecum', 'https://secure.gravatar.com/avatar/2cc9a4601fa2008e4b12e4e7a6a3a403.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jordan', 'Obey', 'https://secure.gravatar.com/avatar/52cc067cd93ada115271f9c1a88b47a2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Morgan', 'McCrory', 'https://secure.gravatar.com/avatar/a7e54d6a844b4e6dd61fe6bba2933543.png?r=PG&amp;d=mm&amp;s=300'],
    ['Nadia', 'Bajwa', 'https://secure.gravatar.com/avatar/682fd579f94f5b03d9e23a52a55af202.png?r=PG&amp;d=mm&amp;s=300'],
    ['Paul', 'Clegg', 'https://secure.gravatar.com/avatar/663783cda018b5647390deed8675f6b0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Sara', 'Chen', 'https://secure.gravatar.com/avatar/f99c6b9c8bb2bbc3163da979eb82d792.png?r=PG&amp;d=mm&amp;s=300'],
    ['Susan', 'Schmidt', 'https://secure.gravatar.com/avatar/2a16da0c515ef8d9c30046b7386b0bfd2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Taylor', 'Masterson', 'https://secure.gravatar.com/avatar/7381fc77468b137f028f4c0534bd9bbe.png?r=PG&amp;d=mm&amp;s=300'],
    ['Yiannis', 'Moses', 'https://secure.gravatar.com/avatar/59f0dd4e300eb95ca435276fa69601ef7.png?r=PG&amp;d=mm&amp;s=300'],
    ['Zachary', 'Harris', 'https://secure.gravatar.com/avatar/e02693d1f604f4b3a141fd970a865741.png?r=PG&amp;d=mm&amp;s=300'],
    ['Chris', 'Singer', 'https://secure.gravatar.com/avatar/bafdb2bebad2da2617ff10f8a66780bf.png?r=PG&amp;d=mm&amp;s=300'],
    ['Daniel', 'Martinez', 'https://secure.gravatar.com/avatar/0aac8dc486284b0da1d56a0c66dedbf8.png?r=PG&amp;d=mm&amp;s=300'],
    ['Elizabeth', 'Blackburn', 'https://secure.gravatar.com/avatar/5104d909fae07554dfd12e2385e79406.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jan', 'Dennison', 'https://secure.gravatar.com/avatar/6ce697629323d1a583b7dc9d3c533bd9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jonathan', 'Roger', 'https://secure.gravatar.com/avatar/8ddaf2dd860101485b4a05b1f2130053d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jose', 'Fernando Roman', 'https://secure.gravatar.com/avatar/54c6d9f6f832672902fced27e0e794f7.png?r=PG&amp;d=mm&amp;s=300'],
    ['Maisam', 'Somji', 'https://secure.gravatar.com/avatar/57761ac0fe8b01dcef8476a7b1229924.png?r=PG&amp;d=mm&amp;s=300'],
    ['Mary', 'Baylis', 'https://secure.gravatar.com/avatar/b4325c1bc35be23516d21af2103d7b8d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Peter', 'Mueller', 'https://secure.gravatar.com/avatar/8343c0300642643e2d45124cda4946f9e.png?r=PG&amp;d=mm&amp;s=300'],
    ['Tirthankar', 'Bhattacharjee', 'https://secure.gravatar.com/avatar/54c5fd24ea91f0361ed8243f2d8a1d31.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ayako', 'Kurushima', 'https://secure.gravatar.com/avatar/c604e80849940764dbc5b4e76a5ad8fa.png?r=PG&amp;d=mm&amp;s=300'],
    ['Brandi', 'M. Ford', 'https://secure.gravatar.com/avatar/1256a9b65d2bbb0ce08c2e7891486748.png?r=PG&amp;d=mm&amp;s=300'],
    ['Brandon', 'Chan', 'https://secure.gravatar.com/avatar/535b3735e3f891017f11ce9f5574e62e.png?r=PG&amp;d=mm&amp;s=300'],
    ['Campbell', 'Belden', 'https://secure.gravatar.com/avatar/d9c1efff5460a84630647d24b3f0e0a0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Chad', 'Centofante', 'https://secure.gravatar.com/avatar/72b33ed873841f5c80991ab1357e955b.png?r=PG&amp;d=mm&amp;s=300'],
    ['Dan', 'Klos', 'https://secure.gravatar.com/avatar/6f29143f2dea169fb9d16865d395e38d.png?r=PG&amp;d=mm&amp;s=300'],
    ['David', 'Hallinan', 'https://secure.gravatar.com/avatar/c599efac38f23c766a82f6ae6e1ae22c.png?r=PG&amp;d=mm&amp;s=300'],
    ['David', 'P. Hanesana', 'https://secure.gravatar.com/avatar/d273e0f8b5094975cfaed6dae61a0551.png?r=PG&amp;d=mm&amp;s=300'],
    ['Derek', 'Tang', 'https://secure.gravatar.com/avatar/1bc7b1e64ac7de5661ed0794157486f0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Dillon', 'Downey', 'https://secure.gravatar.com/avatar/4a27216aec34ead9d65266dd60f358e1.png?r=PG&amp;d=mm&amp;s=300'],
    ['Eddie', 'Munoz', 'https://secure.gravatar.com/avatar/d843e8d88842075fc4ec50a4e227130a.png?r=PG&amp;d=mm&amp;s=300'],
    ['Emily', 'Gerngross', 'https://secure.gravatar.com/avatar/b8718ac34a1533d1e2e9b382141208f0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Eugene', 'Shuster', 'https://secure.gravatar.com/avatar/c83e56bc2177f703de9da0cfa15c9291.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ginny', 'Martin', 'https://secure.gravatar.com/avatar/dd3df7f0d950e6c88ff7978262300703d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Grace', 'Yasukawa', 'https://secure.gravatar.com/avatar/f54894b52496540c957c304ddbed1e4c.png?r=PG&amp;d=mm&amp;s=300'],
    ['Hugh', 'Sutton-Gee', 'https://secure.gravatar.com/avatar/ba59dd1efc824e8277be0940293d9ba5.png?r=PG&amp;d=mm&amp;s=300'],
    ['Irene', 'Ma', 'https://secure.gravatar.com/avatar/508d1f06a93a951509bb0d8e0cba11e9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jesse', 'Callwood', 'https://secure.gravatar.com/avatar/41b7443e4e253ce9f264f4304418efc2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jonathan', 'Aguilar', 'https://secure.gravatar.com/avatar/fc96033a26148b5300a5b7ea4a451008d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Joyce', 'De La Torre', 'https://secure.gravatar.com/avatar/e1e12d2a24d742fc755f881bae0fc4d9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Katrina', 'Eaton', 'https://secure.gravatar.com/avatar/1b9d92e320239783fce18208b28b1c74.png?r=PG&amp;d=mm&amp;s=300'],
    ['Lawrence', 'Yu', 'https://secure.gravatar.com/avatar/587b5d8666b5548f7ca2539c1068687b.png?r=PG&amp;d=mm&amp;s=300'],
    ['Leandra', 'Kim', 'https://secure.gravatar.com/avatar/09fd5d027679e76e6ebb192106ae75e0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ling', 'Giang', 'https://secure.gravatar.com/avatar/3da12f912120c9cacbf9a02444533723.png?r=PG&amp;d=mm&amp;s=300'],
    ['Lynne', 'Tye', 'https://secure.gravatar.com/avatar/53028f7662c13f8766f8d7325dd02890.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Avtonomoff', 'https://secure.gravatar.com/avatar/c333003a59ede501d5a18527a739307f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Lim', 'https://secure.gravatar.com/avatar/654fdfcf192788d99b777545070cd1f4.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Walker', 'https://secure.gravatar.com/avatar/6ff6a415d255b4e3a48ac4a8fdcd948e.png?r=PG&amp;d=mm&amp;s=300'],
    ['Rafael', 'de Figueiredo Auriemo', 'https://secure.gravatar.com/avatar/eefb64de75538d434462fa540bb64f59.png?r=PG&amp;d=mm&amp;s=300'],
    ['Sara', 'Gilford', 'https://secure.gravatar.com/avatar/e8d3a1d61beac5bc300e6802b7e1d58ba.png?r=PG&amp;d=mm&amp;s=300'],
    ['Seyoung', 'Kwak', 'https://secure.gravatar.com/avatar/7efb61a9b3bee55171abb51942adfea9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Silas', 'Kwong', 'https://secure.gravatar.com/avatar/c6590ece01c70f4b88d3588df4c43fc6.png?r=PG&amp;d=mm&amp;s=300'],
    ['Stefanie', 'Swift', 'https://secure.gravatar.com/avatar/40c85d421091e27e23d0569b47c367d1.png?r=PG&amp;d=mm&amp;s=300'],
    ['Andrew', 'Carlson', 'https://secure.gravatar.com/avatar/ee18738c63ff567831e86ba6db49bfc6.png?r=PG&amp;d=mm&amp;s=300'],
    ['Arturo', 'Perez', 'https://secure.gravatar.com/avatar/a32f1548b6c2a3d4b70bc8e69e835b24.png?r=PG&amp;d=mm&amp;s=300'],
    ['Caitlyn', 'Yu', 'https://secure.gravatar.com/avatar/473b9ac043bedeb76f12d5905c300c7bb.png?r=PG&amp;d=mm&amp;s=300'],
    ['Calvin', 'Settachatgul', 'https://secure.gravatar.com/avatar/a3d3fb4c6eadf0aa4aa9a2fdb594179b.png?r=PG&amp;d=mm&amp;s=300'],
    ['Charles', 'Whitfield', 'https://secure.gravatar.com/avatar/c59285e0e20f13a7fd26b3ff9e80f5c6.png?r=PG&amp;d=mm&amp;s=300'],
    ['Charlie', 'Ward', 'https://secure.gravatar.com/avatar/d64187fc5c3e5d5a2a991d0e91e003f3.png?r=PG&amp;d=mm&amp;s=300'],
    ['Dan', 'Rollans', 'https://secure.gravatar.com/avatar/3024e7be87540d1c600adb221d77d21f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Darwin', 'Wu', 'https://secure.gravatar.com/avatar/887a7684cc3a97fb59b2ed191ff8490d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Edwin', 'Unger', 'https://secure.gravatar.com/avatar/8388de0079591b5f3b76b7e29b3ce545.png?r=PG&amp;d=mm&amp;s=300'],
    ['Erica', 'Marroquin', 'https://secure.gravatar.com/avatar/0a28aa3c6ebd8565e6c86a603c80416d.png?r=PG&amp;d=mm&amp;s=300'],
    ['Guilherme', 'Sa', 'https://secure.gravatar.com/avatar/63b601b3f069fe4edf6c27fbf69c3474.png?r=PG&amp;d=mm&amp;s=300'],
    ['Henry', 'Vega', 'https://secure.gravatar.com/avatar/fc34b7ca5e5340fa2bbd875abebe4c3f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jack', 'Zampolin', 'https://secure.gravatar.com/avatar/69a7d1d4b383d33008216a631f01dd157.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jacob', 'Moyle', 'https://secure.gravatar.com/avatar/4ff536222604ca4277f37bd95b455300.png?r=PG&amp;d=mm&amp;s=300'],
    ['Janet', 'Brown', 'https://secure.gravatar.com/avatar/13de1fc4c41fb6214c540b2bd3aa256f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jason', 'Zhao', 'https://secure.gravatar.com/avatar/0705a663ab8f576a993a0234619913b1.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jeanine', 'Loughlin', 'https://secure.gravatar.com/avatar/b432d6cc83b6b6d356d26afb192e1b85.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jerome', 'Chenette', 'https://secure.gravatar.com/avatar/ff56b05d9ee00f9179232064df4c168c.png?r=PG&amp;d=mm&amp;s=300'],
    ['Keith', 'Conroy', 'https://secure.gravatar.com/avatar/15a8f4a47e6130ce6d953fa262eb8fec.png?r=PG&amp;d=mm&amp;s=300'],
    ['Mary', 'Wallace', 'https://secure.gravatar.com/avatar/36aa77764372510f4cc40dd1c2804c93.png?r=PG&amp;d=mm&amp;s=300'],
    ['Melissa', 'Bur', 'https://secure.gravatar.com/avatar/6283f64be2d5a9069a33f9ea8c3529c3.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Thomas Zellner', 'https://secure.gravatar.com/avatar/4af8f9f9c832489302b7fff9a08a6a95.png?r=PG&amp;d=mm&amp;s=300'],
    ['Nam', 'Hoang Nguyen', 'https://secure.gravatar.com/avatar/939a4a7fec910f72245167b13005b3778.png?r=PG&amp;d=mm&amp;s=300'],
    ['Nam', 'Huynh', 'https://secure.gravatar.com/avatar/eeef75120b730a3da93faa3d869da8d3.png?r=PG&amp;d=mm&amp;s=300'],
    ['Nico', 'Lazzara', 'https://secure.gravatar.com/avatar/4d9c22ebe19692c30fc58a9741cde5e0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Nicole', 'Wisler', 'https://secure.gravatar.com/avatar/fc129d6207af23bf088eed290434a42b.png?r=PG&amp;d=mm&amp;s=300'],
    ['Piara', 'Bagg Singh Sandhu', 'https://secure.gravatar.com/avatar/77ddaff835f2c3c4665f5a0deae27cb2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Raghu', 'Reddy', 'https://secure.gravatar.com/avatar/9e62c7e6316f3e2a74860403cdf8dbd1.png?r=PG&amp;d=mm&amp;s=300'],
    ['Sean', 'Sassenrath', 'https://secure.gravatar.com/avatar/3102050a18caca297083d4c76c7f2aaa.png?r=PG&amp;d=mm&amp;s=300'],
    ['Shriyan', 'Gunasekera', 'https://secure.gravatar.com/avatar/b0166e8ccadcda3c727b0d7804a675d0.png?r=PG&amp;d=mm&amp;s=300'],
    ['Taniya', 'Prabhakar', 'https://secure.gravatar.com/avatar/711d30095c5914e3854e1c62d2474f10e.png?r=PG&amp;d=mm&amp;s=300'],
    ['Timothy', 'Steele', 'https://secure.gravatar.com/avatar/03a4e3966ac3a7510e17f354418f1d25.png?r=PG&amp;d=mm&amp;s=300'],
    ['Tim', 'Powers', 'https://secure.gravatar.com/avatar/12885ac7bd299f48ae9f196a028231c9.png?r=PG&amp;d=mm&amp;s=300'] ]

dbc_students.shuffle!
i = 0

40.times do
  parent = Parent.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
    )
  parent.update(email: "user#{parent.id}@gmail.com") #allows us to sign in as seed users
  3.times do
    child = parent.children.create(
      first_name: dbc_students[i] ? dbc_students[i][0] : Faker::Name.first_name,
      last_name: dbc_students[i] ? dbc_students[i][1] : Faker::Name.last_name,
      city: cities.sample,
      state: 'CA',
      phone: rand.to_s[2..11],
      gender: ['male', 'female', 'other'].sample,
      sexual_preference: ['men', 'women', 'no preference'].sample,
      birthdate: Faker::Date.between(50.years.ago, 18.years.ago),
      bio: Faker::Company.bs,
      religion: ['Christian','Muslim','Buddhist', 'Atheist', 'Rastafarian', 'Pastafarian', 'Hindu', 'Sikh', 'Jewish', 'Shinto', 'Shamanist', 'Scientologist', 'Mormon'].sample,
      smoke: [true, false].sample,
      linkedin_url: Faker::Internet.url,
      facebook_url: Faker::Internet.url,
      embarrassing_moment: Faker::Hacker.say_something_smart,
      pf_image_1: dbc_students[i] ? dbc_students[i][2] : Faker::Avatar.image,
      pf_image_2: Faker::Avatar.image,
      pf_image_3: Faker::Avatar.image,
      pf_image_4: Faker::Avatar.image,
      pf_image_5: Faker::Avatar.image
      )
    5.times do
      child.interests << interests.sample
    end
    5.times do
      child.values << values.sample
    end
    i += 1
  end
end

children = Child.all.shuffle
15.times do #create pending dates
  Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    )
end
15.times do #create accepted dates
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    recipient_accepted: true,
    )

end
15.times do #create confirmed dates
  experience_time = Faker::Time.forward(50, :evening)
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    note: Faker::Lorem.paragraph,
    recipient_accepted: true,
    initiator_confirmed: true,
    recipient_confirmed: true,
    )
  playdate.create_experience(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    desc_summary: "Dinner for two",
    desc_note_1: "Intimate experience at their newest location",
    desc_note_2: "Famous for their gnocchi and fried calamari",
    desc_note_3: "Vegetarian and gluten-free friendly",
    price_per_person: rand(30..100),
    image: experience_photos.sample,
    experience_at: experience_time,
    )
  playdate.create_movie(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    director: Faker::Name.name,
    rating: rand(40..100),
    image: Faker::Avatar.image,
    movie_at: experience_time + 2.hours,
    )
  playdate.save
end
15.times do #create paid dates
  experience_time = Faker::Time.forward(20, :evening)
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    note: Faker::Lorem.paragraph,
    recipient_accepted: true,
    initiator_confirmed: true,
    recipient_confirmed: true,
    initiator_paid: true,
    recipient_paid: true,
    )
  playdate.create_experience(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    desc_summary: "Dinner for two",
    desc_note_1: "Intimate experience at their newest location",
    desc_note_2: "Famous for their gnocchi and fried calamari",
    desc_note_3: "Vegetarian and gluten-free friendly",
    price_per_person: rand(30..100),
    image: experience_photos.sample,
    experience_at: experience_time,
    )
  playdate.create_movie(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    director: Faker::Name.name,
    rating: rand(40..100),
    image: movie_posters.sample,
    movie_at: experience_time + 2.hours,
    )
  playdate.save

end
