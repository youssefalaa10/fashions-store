import 'package:fashions/modules/categories/products_screen.dart';
import 'package:fashions/shared/app_color.dart';
import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return buildCategoryItem(context, categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, CategoryItem category) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColor.blackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductsScreen()));
        },
        leading: category.leadingIcon,
        title: Text(
          category.title,
          style: TextStyle(color: AppColor.whiteColor),
        ),
        trailing: Text(
          category.trailingText,
          style: TextStyle(color: AppColor.greyColor),
        ),
      ),
    );
  }
}
