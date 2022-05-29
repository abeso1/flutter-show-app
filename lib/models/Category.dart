class Category {
  int? salonCategoryId;
  String? name;
  List<SubCategory>? subcategories;
  String? imagePath;
  int? numberOfSalons;
  bool? isActive;

  Category({
    this.name,
    this.salonCategoryId,
    this.subcategories,
    this.imagePath,
    this.numberOfSalons,
    this.isActive,
  });

  Category.fromJson(Map<String, dynamic> json) {
    numberOfSalons = json["NumberOfSalons"];
    imagePath = json["ImagePath"];
    name = json["Name"];
    isActive = json['IsActive'];
    salonCategoryId = json["SalonCategoryId"];
    subcategories = List.from(json["SalonTypes"])
        .map((item) => SubCategory.fromJson(item))
        .toList();
  }
}

class SubCategory {
  int? salonTypeId;
  String? name;

  SubCategory({this.salonTypeId, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    salonTypeId = json["SalonTypeId"];
    name = json["Name"];
  }
}
