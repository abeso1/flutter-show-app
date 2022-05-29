import 'package:flutter_show_app/interceptors/appInterceptor.dart';
import 'package:flutter_show_app/models/Category.dart';

class CategoriesServices {
  static Future<List<Category>> getCategories() => http
      .get(
        '/saloncategory',
      )
      .then((value) => List.from(value.data)
          .map((item) => Category.fromJson(item))
          .toList());
}
