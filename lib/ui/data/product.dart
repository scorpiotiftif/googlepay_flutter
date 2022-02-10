var products = [
  Product("Nike Sportswear"
      , "COURT BOROUGH MID 2 UNISEX - Baskets montantes"
      , 39.95
      , "https://img01.ztat.net/article/spp-media-p1/2804a17c00a0413890cecd48eea6ce93/715158ac1bff4479a063a270c66f5d32.jpg?imwidth=1800&filter=packshot"
  )
  ,Product("Los Angeles Lakers Showtime"
      , "Pantalon NBA Nike Dri-FIT pour Homme"
      , 99.99
      , "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/0cc43c0d-6b81-47ad-9401-4a626e0e7c83/pantalon-dri-fit-nba-los-angeles-lakers-showtime-pour-KqLSdg.png"
  )
  ,Product("Jordan Essentials"
      , "Haut en tissu Fleece pour Femme"
      , 39.95
      , "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/f1dc27fb-4c3c-435c-90ac-2514fce91ecf/haut-en-tissu-fleece-jordan-essentials-pour-TSJx2X.png"
  )
  ,Product("CASQUETTE ADIDAS X CLASSIC LEGO®"
      , "UNE CASQUETTE ISSUE DE LA COLLECTION ADIDAS ET LEGO® GROUP."
      , 18
      , "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5f161205d7cf4240bb55acfc013bf985_9366/Casquette_adidas_x_Classic_LEGO(r)_Multicolore_GU3743_01_standard.jpg"
  )
  ,Product("VESTE DE RUNNING"
      , "COLD.RDY"
      , 200
      , "https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/d4023639615946f996a2adb200bc33ef_9366/Veste_de_running_COLD.RDY_Bleu_GT5544_HM1.jpg"
  )
];

class Product{

  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(this.name, this.description, this.price, this.imageUrl);
}