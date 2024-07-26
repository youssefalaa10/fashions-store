import 'package:flutter/material.dart';

import '../shared/app_color.dart';

class CategoryItem {
  final String title;
  final Icon leadingIcon;
  final String trailingText;

  CategoryItem({
    required this.title,
    required this.leadingIcon,
    required this.trailingText,
  });
}

final List<CategoryItem> categories = [
  CategoryItem(
    title: 'Clothing',
    leadingIcon: Icon(Icons.shopping_bag, color: AppColor.whiteColor),
    trailingText: '208 Products',
  ),
  CategoryItem(
    title: 'Electronics',
    leadingIcon: Icon(Icons.electrical_services, color: AppColor.whiteColor),
    trailingText: '150 Products',
  ),
  CategoryItem(
    title: 'Home Appliances',
    leadingIcon: Icon(Icons.kitchen, color: AppColor.whiteColor),
    trailingText: '95 Products',
  ),
  CategoryItem(
    title: 'Books',
    leadingIcon: Icon(Icons.book, color: AppColor.whiteColor),
    trailingText: '300 Products',
  ),
  CategoryItem(
    title: 'Toys',
    leadingIcon: Icon(Icons.toys, color: AppColor.whiteColor),
    trailingText: '120 Products',
  ),
  CategoryItem(
    title: 'Groceries',
    leadingIcon: Icon(Icons.local_grocery_store, color: AppColor.whiteColor),
    trailingText: '250 Products',
  ),
];
