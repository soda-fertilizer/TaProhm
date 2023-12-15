// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatefulWidget {
  const Gallery({
    Key? key,
    this.width,
    this.height,
    required this.imageList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> imageList;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: widget.imageList
          .map((item) => Center(
                  child: Image.network(
                item,
                fit: BoxFit.contain,
                height: widget.height,
              )))
          .toList(),
    );
  }
}
