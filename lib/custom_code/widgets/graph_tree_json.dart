// Automatic FlutterFlow imports
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

import 'package:graphview/GraphView.dart';

class GraphTreeJson extends StatefulWidget {
  const GraphTreeJson({
    Key? key,
    this.width,
    this.height,
    this.listOfUsers,
    this.headOfUser,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<dynamic>? listOfUsers;
  final UsersRow? headOfUser;

  @override
  _GraphTreeJsonState createState() => _GraphTreeJsonState();
}

class _GraphTreeJsonState extends State<GraphTreeJson> {
  late List<_NodeStruck> data;

  Widget rectangleWidget(_NodeStruck user) {
    return InkWell(
      // ! This is for on tap action
      // onTap: () {
      //   print(user.phoneNumber);
      // },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
            ],
          ),
          child: Text(user.fullName)),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();

    data = widget.listOfUsers
            ?.map((user) => _NodeStruck(
                  id: user['UserID'],
                  fullName: user['FullName'],
                  phoneNumber: user['PhoneNumber'],
                  userReference: user['UserReferral'],
                ))
            .toList() ??
        [];

    if (widget.headOfUser != null) {
      data.add(_NodeStruck(
        id: widget.headOfUser!.userID,
        fullName: widget.headOfUser!.fullName,
        phoneNumber: widget.headOfUser!.phoneNumber,
        userReference: widget.headOfUser!.userReferral ?? '',
      ));
    }

    Map<String, Node> nodeMap = {};

    for (var user in data) {
      if (user.phoneNumber == user.userReference) {
        user.userReference = '';
      }
    }

    for (var user in data) {
      nodeMap[user.phoneNumber] = Node.Id(user.id);
    }

    for (var user in data) {
      if (nodeMap.containsKey(user.userReference)) {
        graph.addEdge(nodeMap[user.userReference]!, nodeMap[user.phoneNumber]!);
      }
    }

    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (30)
      ..subtreeSeparation = (30)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return widget.listOfUsers!.length < 2 && widget.headOfUser == null
        ? Container()
        : InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(double.infinity), // grap size
            minScale: 0.01,
            maxScale: 5.6,
            child: GraphView(
              graph: graph,
              algorithm:
                  BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
              paint: Paint()
                ..color = Colors.green
                ..strokeWidth = 1
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                var a = node.key!.value as int;
                _NodeStruck user = data.firstWhere((e) => e.id == a);
                return rectangleWidget(user);
              },
            ),
          );
  }
}

class _NodeStruck {
  _NodeStruck(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.userReference});

  int id;
  String fullName;
  String phoneNumber;
  String userReference;
}
