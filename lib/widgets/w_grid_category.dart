import 'package:flutter/material.dart';
import 'package:meals_app/models/category_class.dart';

const textStyleTemp = TextStyle(
  color: Color.fromARGB(255, 247, 245, 245),
  fontSize: 16,
  fontStyle: FontStyle.italic,
);

class WGridItem extends StatelessWidget {
  const WGridItem({
    super.key,
    required this.category,
    required this.onselectCategory,
  });

  final CategoryData category;
  final void Function() onselectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectCategory,
      hoverColor: Theme.of(context).primaryColor,
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.4),
            category.color..withOpacity(0.9)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: Text(
          style: textStyleTemp,
          category.title,
        ),
      ),
    );
  }
}
