import 'package:flutter/material.dart';

class CategoryWallsPage extends StatefulWidget {
  final String selectedCategoryName;
  const CategoryWallsPage({Key? key, required this.selectedCategoryName}) : super(key: key);

  @override
  State<CategoryWallsPage> createState() => _CategoryWallsPageState();
}

class _CategoryWallsPageState extends State<CategoryWallsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedCategoryName.toUpperCase() + ' Walls'),
      ),
    );
  }
}
