import 'package:flutter/material.dart';
import 'package:wall/screens/wall_details.dart';
import 'package:wall/models/wall_model.dart';

class CategoryWallsPage extends StatefulWidget {
  final String selectedCategoryName;
  final AsyncSnapshot<List<WallModel>> snapshotR;
  const CategoryWallsPage({Key? key, required this.selectedCategoryName, required this.snapshotR}) : super(key: key);

  @override
  State<CategoryWallsPage> createState() => _CategoryWallsPageState();
}

class _CategoryWallsPageState extends State<CategoryWallsPage> {

  @override
  Widget build(BuildContext context) {
    final selectedCategory = widget.snapshotR.data!.where((element) => (element.category == widget.selectedCategoryName));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedCategoryName.toUpperCase() + ' Walls'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: selectedCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WallDetails()));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(selectedCategory.elementAt(index).url!),
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.2),
                alignment: Alignment.center,
                child: Text(selectedCategory.elementAt(index).name.toString(), style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
          );
        },
      ),
    );
  }
}
