class Home {
  final title;
  final image;
  final price;
  final desc;

  Home({this.title, required this.image, this.price, this.desc});
}

final List<Home> homes = [
  //Cones category
  Home(
      title: "Strawberry Cheesecake Cone",
      image: "images/cone1.png",
      price: "Rs 180",
      desc: "Delicious strawberry Cheesecake flavored ice cream in a cone."),
  Home(
      title: "Chocolate Cone",
      image: "images/cone5.jpg",
      price: "Rs 180",
      desc: "Rich chocolate flavored ice cream in a crispy cone."),
  Home(
      title: "Caramel Cone",
      image: "images/cone3.png",
      price: "Rs 200",
      desc: "Creamy caramel flavored ice cream in a cone."),
  Home(
      title: "Blueberry Cone",
      image: "images/cone4.png",
      price: "Rs 150",
      desc:
          "The most running item, our Creamy Blueberry flavored ice cream in a cone."),
  Home(
      title: 'Sprinkled Cone',
      image: "images/cone6.png",
      price: "Rs 150",
      desc:
          "Rich and Extra Sprinkled ice cream in a crispy cone, You feel an amazing experience"),

  // magnum = index+5
  Home(
      title: "Magnum Premium",
      image: "images/magnum1.png",
      price: "Rs 250",
      desc:
          "Premium vanilla ice cream coated with a layer of rich chocolate and chunks of nuts"),
  Home(
      title: "Magnum Fudge",
      image: "images/magnum3.png",
      price: "Rs 250",
      desc: "Delicious fudge-flavored ice cream in a chocolate shell."),

  //   //Ice Candy Now index +  7
  Home(
      title: "Orange Ice Pop",
      image: "images/iceorange.png",
      price: "Rs 50",
      desc: "Refreshing orange flavored ice candy on a stick."),
  Home(
      title: "Watermelon Ice Pop",
      image: "images/icewatermelon.png",
      price: "Rs 80",
      desc:
          "Our unique and Juicy watermelon flavored ice candy, with its shape"),
  Home(
      title: "Strawberry Ice Pop",
      image: "images/icered.png",
      price: "Rs 50",
      desc: "Refreshing Strawberry flavored ice candy on a stick"),

  //Sundaes Now index +10
  Home(
      title: "Oreo Sandwich",
      image: "images/sundae4.png",
      price: "Rs 350",
      desc: "Delectable Oreo ice cream sandwich, with 2 layers of chocolate"),
  Home(
      title: "Blueberry Cup",
      image: "images/sundae3.png",
      price: "Rs 100",
      desc: "Creamy blueberry ice cream in a cup."),
  Home(
      title: "Coffe Cup",
      image: "images/sundae1.png",
      price: "Rs 100",
      desc: "Creamy Coffe Flavoured ice cream in a cup."),

  //Specials Now index + 13
  Home(
      title: "Peshawari Oreo",
      image: "images/special2.png",
      price: "Rs 100",
      desc: "A Peshawari twist on the classic Oreo ice cream."),
  Home(
      title: "Matka Kulfi",
      image: "images/special4.png",
      price: "Rs 200",
      desc: "Traditional matka kulfi with a rich and creamy texture."),
  Home(
      title: "Peshawari Chocochip",
      image: "images/special1.png",
      price: "Rs 100",
      desc:
          "A Peshawari twist with the Chocolate chips in the ice cream, having a fully chocolate flavour"),
  Home(
      title: "Peshawari Strawberry",
      image: "images/special3.png",
      price: "Rs 100",
      desc: "Traditional matka kulfi with a rich and creamy texture."),

  // Popular yaha index +17 means k upr 17 items ha usme bad jo index hai wo popular me show hoga
  Home(
      title: "Matka Kulfi",
      image: "images/special4.png",
      price: "Rs 200",
      desc: "Traditional matka kulfi with a rich and creamy texture."),
  Home(
      title: "Oreo Sandwich",
      image: "images/sundae4.png",
      price: "Rs 350",
      desc: "Delectable Oreo ice cream sandwich, with 2 layers of chocolate"),
  Home(
      title: "Watermelon Ice Candy",
      image: "images/icewatermelon.png",
      price: "Rs 80",
      desc:
          "Our unique and Juicy watermelon flavored ice candy, with its shape"),
  Home(
      title: "Strawberry Cheesecake",
      image: "images/cone1.png",
      price: "Rs 150",
      desc: "Delicious strawberry Cheesecake flavored ice cream in a cone."),
  Home(
      title: "Peshawari Oreo",
      image: "images/special2.png",
      price: "Rs 120",
      desc: "A Peshawari twist on the classic Oreo ice cream."),
];
