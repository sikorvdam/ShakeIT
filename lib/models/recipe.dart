class Recipe {
  final String id;
  final String name;
  final String category;
  final String imageIcon;
  final List<String> ingredients;
  final String instructions;
  final String description;

  const Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.imageIcon,
    required this.ingredients,
    required this.instructions,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'imageIcon': imageIcon,
        'ingredients': ingredients,
        'instructions': instructions,
        'description': description,
      };

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json['id'] as String,
        name: json['name'] as String,
        category: json['category'] as String,
        imageIcon: json['imageIcon'] as String,
        ingredients: List<String>.from(json['ingredients'] as List),
        instructions: json['instructions'] as String,
        description: json['description'] as String,
      );
}