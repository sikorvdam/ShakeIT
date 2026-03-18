import '../models/recipe.dart';

const List<Recipe> sampleRecipes = [
  // Shoty
  Recipe(
    id: '1',
    name: 'Tequila Shot',
    category: 'Shoty',
    imageIcon: 'whiskey',
    ingredients: [
      '50ml Tequila',
      'Sól morska',
      'Plasterek limonki',
    ],
    instructions:
        '1. Wysyp sól na talerzyk\n2. Zliz sól z dłoni\n3. Wypij tequilę\n4. Zgryz plasterkiem limonki',
    description: 'Klasyczny meksykański shot - hit na każdej imprezie!',
  ),
  Recipe(
    id: '2',
    name: 'Jägerbomb',
    category: 'Shoty',
    imageIcon: 'local_bar',
    ingredients: [
      '20ml Jägermeister',
      '100ml Red Bull',
    ],
    instructions:
        '1. Nalej Red Bull do szklanki\n2. Wlej Jägermaster do shot glass\n3. Wrzuć shot do Red Bulla\n4. Wypij jednym haustem',
    description: 'Energizing shot łączący ziołowy likier z energią!',
  ),
  Recipe(
    id: '3',
    name: 'Kamikaze',
    category: 'Shoty',
    imageIcon: 'local_bar',
    ingredients: [
      '30ml Wódka',
      '30ml Triple Sec',
      '30ml Sok z limonki',
    ],
    instructions:
        '1. Wstrząśnij wszystkie składniki z lodem\n2. Przelej do shotów\n3. Podawaj natychmiast',
    description: 'Ostry, cytrusowy shot - idealny na rozgrzewkę!',
  ),

  // Koktajle
  Recipe(
    id: '4',
    name: 'Mojito',
    category: 'Koktajle',
    imageIcon: 'local_bar',
    ingredients: [
      '50ml Biały rum',
      '30ml Sok z limonki',
      '20ml Cukier trzcinowy',
      '6 Listków mięty',
      'Woda gazowana',
    ],
    instructions:
        '1. Rozgnieć miętę z cukrem i sokiem\n2. Dodaj rum\n3. Wypełnij lodem\n4. Dolej wody gazowanej\n5. Dekoruj miętą',
    description:
        'Orzeźwiający kubajski klasyk z miętą i limonką!',
  ),
  Recipe(
    id: '5',
    name: 'Pina Colada',
    category: 'Koktajle',
    imageIcon: 'local_bar',
    ingredients: [
      '60ml Biały rum',
      '60ml Mleko kokosowe',
      '90ml Sok ananasowy',
      '20ml Cukier',
      'Lód',
    ],
    instructions:
        '1. Wszystko zmiksuj z lodem\n2. Przelej do wysokiej szklanki\n3. Dekoruj plasterkiem ananasa\n4. Dodaj parasolka',
    description: 'Tropikalny raj w szklance!',
  ),
  Recipe(
    id: '6',
    name: 'Margarita',
    category: 'Koktajle',
    imageIcon: 'local_bar',
    ingredients: [
      '50ml Tequila',
      '25ml Triple Sec',
      '25ml Sok z limonki',
      'Sól do szklanki',
    ],
    instructions:
        '1. Posól krawędź szklanki\n2. Wstrząśnij składniki z lodem\n3. Przelej do szklanki\n4. Podawaj z plasterkiem limonki',
    description: 'Najsłynniejszy koktajl z tequili!',
  ),
  Recipe(
    id: '7',
    name: 'Long Island Iced Tea',
    category: 'Koktajle',
    imageIcon: 'local_bar',
    ingredients: [
      '15ml Wódka',
      '15ml Gin',
      '15ml Rum',
      '15ml Tequila',
      '15ml Triple Sec',
      '25ml Sok z cytryny',
      '15ml Syrop cukrowy',
      'Cola',
    ],
    instructions:
        '1. Wstrząśnij alkohole z sokiem i syropem\n2. Wlej do szklanki z lodem\n3. Dolej coli\n4. Dekoruj plastrem cytryny',
    description: 'Mocny koktajl o smaku herbaty - ukryty alkohol!',
  ),

  // Klasyczne
  Recipe(
    id: '8',
    name: 'Old Fashioned',
    category: 'Klasyczne',
    imageIcon: 'wine_bar',
    ingredients: [
      '60ml Bourbon',
      '10ml Syrop cukrowy',
      '2 Kropki Angostura',
      'Pomarańcza',
    ],
    instructions:
        '1. Wymieszaj wszystko z lodem\n2. Przelej do szklanki rocks\n3. Wyciśnij skórkę pomarańczy\n4. Podawaj z kostkami lodu',
    description: 'Elegancki klasyk - ojciec wszystkich koktajli!',
  ),
  Recipe(
    id: '9',
    name: 'Negroni',
    category: 'Klasyczne',
    imageIcon: 'wine_bar',
    ingredients: [
      '30ml Gin',
      '30ml Campari',
      '30ml Słodki vermouth',
    ],
    instructions:
        '1. Mieszaj składniki z lodem\n2. Przelej do szklanki rocks\n3. Dekoruj plasterkiem pomarańczy',
    description: 'Włoski klasyk o gorzkim charakterze!',
  ),
  Recipe(
    id: '10',
    name: 'Whiskey Sour',
    category: 'Klasyczne',
    imageIcon: 'wine_bar',
    ingredients: [
      '60ml Whiskey',
      '30ml Sok z cytryny',
      '20ml Syrop cukrowy',
      'Białko jajka (opcjonalnie)',
    ],
    instructions:
        '1. Wstrząśnij wszystko z lodem\n2. Przelej do szklanki rocks\n3. Dodaj kostki lodu\n4. Dekoruj wiśnią',
    description: 'Klasyczny sour z idealną równowagą kwasu i słodyczy!',
  ),
  Recipe(
    id: '11',
    name: 'Martini',
    category: 'Klasyczne',
    imageIcon: 'wine_bar',
    ingredients: [
      '60ml Gin',
      '10ml Wytrawne vermouth',
      'Oliwka lub skórka cytryny',
    ],
    instructions:
        '1. Schłodź kieliszek\n2. Mieszaj gin z vermouth\n3. Przelej do kieliszka\n4. Dodaj oliwkę lub skórkę',
    description: 'Kultowy koktajl szpiegów i elegantów!',
  ),

  // Bezalkoholowe
  Recipe(
    id: '12',
    name: 'Virgin Mojito',
    category: 'Bezalkoholowe',
    imageIcon: 'local_drink',
    ingredients: [
      '30ml Sok z limonki',
      '20ml Cukier trzcinowy',
      '8 Listków mięty',
      'Woda gazowana',
      'Lód',
    ],
    instructions:
        '1. Rozgnieć miętę z cukrem i sokiem\n2. Dodaj lód\n3. Dolej wody gazowanej\n4. Mieszaj i dekoruj miętą',
    description: 'Orzeźwiający bezalkoholowy odpowiednik Mojito!',
  ),
  Recipe(
    id: '13',
    name: 'Shirley Temple',
    category: 'Bezalkoholowe',
    imageIcon: 'local_drink',
    ingredients: [
      '150ml Ginger Ale',
      '50ml Grenadina',
      'Lód',
      'Wiśnie do dekoracji',
    ],
    instructions:
        '1. Nalej ginger ale do szklanki z lodem\n2. Dodaj grenadinę\n3. Mieszaj delikatnie\n4. Dekoruj wiśniami',
    description: 'Słodki, klasyczny mocktail!',
  ),
  Recipe(
    id: '14',
    name: 'Virgin Pina Colada',
    category: 'Bezalkoholowe',
    imageIcon: 'local_drink',
    ingredients: [
      '100ml Sok ananasowy',
      '60ml Mleko kokosowe',
      '20ml Cukier',
      'Lód',
    ],
    instructions:
        '1. Wszystko zmiksuj z lodem\n2. Przelej do wysokiej szklanki\n3. Dekoruj plasterkiem ananasa',
    description: 'Tropikalne orzeźwienie bez alkoholu!',
  ),
  Recipe(
    id: '15',
    name: 'Arnold Palmer',
    category: 'Bezalkoholowe',
    imageIcon: 'local_drink',
    ingredients: [
      '100ml Herbata (schłodzona)',
      '100ml Limonka (schłodzona)',
      'Lód',
      'Plasterek cytryny',
    ],
    instructions:
        '1. Wymieszaj herbatę z sokiem\n2. Dodaj lód\n3. Dekoruj plasterkiem cytryny',
    description: 'Orzeźwiający napój golfisty!',
  ),
];

List<String> getCategories() {
  return ['Shoty', 'Koktajle', 'Klasyczne', 'Bezalkoholowe'];
}

List<Recipe> getRecipesByCategory(String category) {
  return sampleRecipes.where((r) => r.category == category).toList();
}

List<Recipe> searchRecipes(String query) {
  final lowerQuery = query.toLowerCase();
  return sampleRecipes
      .where((r) => r.name.toLowerCase().contains(lowerQuery))
      .toList();
}