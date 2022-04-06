import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wall/categories_view.dart';
import 'package:wall/wall_api.dart';
import 'package:wall/wall_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<WallModel>> wallObject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wallObject = WallApi.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wall App'),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: FutureBuilder<List<WallModel>>(
          future: wallObject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CategoriesView(snapshotW: snapshot);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    setState(() {
      wallObject = WallApi.getPhotos();
    });

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(20),
          content: Text('Refreshed'),
        ),
      );
  }
}

// Container(
// color: Colors.red,
// width: 200,
// height: 200,
// ),
