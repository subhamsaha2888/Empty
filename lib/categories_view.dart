import 'package:flutter/material.dart';
import 'package:wall/category_walls_page.dart';
import 'package:wall/wall_model.dart';

class CategoriesView extends StatefulWidget {
  final AsyncSnapshot<List<WallModel>> snapshotW;
  const CategoriesView({Key? key, required this.snapshotW}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {


  List<String> categories = [];
  List<String> categoryImagesUrl = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.snapshotW.data?.forEach((element) {
      // var category = element.category;
      if (!categories.contains(element.category)) {
        categories.add(element.category!);
        categoryImagesUrl.add(element.url!);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      // cacheExtent: 100,
      // itemExtent: 400,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryWallsPage(selectedCategoryName: categories.elementAt(index), snapshotR: widget.snapshotW,)));
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    NetworkImage(categoryImagesUrl.elementAt(index)))),
            alignment: Alignment.center,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.2),
              alignment: Alignment.center,
              child: Text(categories.elementAt(index).toUpperCase(), style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
        );
      },
    );
  }
}
