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

import 'package:graphview/GraphView.dart';

class GraphTree extends StatefulWidget {
  const GraphTree({
    Key? key,
    this.width,
    this.height,
    this.listOfUsers,
    this.headOfUser,
    required this.onNodeClick,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<UsersRow>? listOfUsers;
  final UsersRow? headOfUser;
  final Future<dynamic> Function() onNodeClick;

  @override
  _GraphTreeState createState() => _GraphTreeState();
}

class _GraphTreeState extends State<GraphTree> {
  // Declaring a list of _NodeStruck objects
  late List<_NodeStruck> data;
  // Method to create a rectangle widget for each user
  Widget rectangleWidget(_NodeStruck user) {
    // Returning an InkWell widget with a Container as its child
    return InkWell(
      // ! This is for on tap action
      onTap: () {
        FFAppState().GrapTreeSelectUserPhoneNumber = user.phoneNumber;
        widget.onNodeClick!();
      },
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

  // Declaring a Graph object and a BuchheimWalkerConfiguration object
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  // Overriding the initState method to initialize the state
  @override
  void initState() {
    super.initState();
    // Initializing the data list with the listOfUsers property of the widget
    data = widget.listOfUsers
            ?.map((user) => _NodeStruck(
                  id: user.userID,
                  fullName: user.fullName,
                  phoneNumber: user.phoneNumber,
                  userReference: user.userReferral ?? '',
                ))
            .toList() ??
        [];
    // Adding the headOfUser property of the widget to the data list if it is not null
    if (widget.headOfUser != null) {
      data.add(_NodeStruck(
        id: widget.headOfUser!.userID,
        fullName: widget.headOfUser!.fullName,
        phoneNumber: widget.headOfUser!.phoneNumber,
        userReference: widget.headOfUser!.userReferral ?? '',
      ));
    }
    // Creating a map of nodes
    Map<String, Node> nodeMap = {};

    // Iterating over the data list and adding nodes to the nodeMap
    for (var user in data) {
      if (user.phoneNumber == user.userReference) {
        user.userReference = '';
      }
    }

    for (var user in data) {
      nodeMap[user.phoneNumber] = Node.Id(user.id);
    }

    // Adding edges to the graph
    for (var user in data) {
      if (nodeMap.containsKey(user.userReference)) {
        graph.addEdge(nodeMap[user.userReference]!, nodeMap[user.phoneNumber]!);
      }
    }

    // Configuring the builder
    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (30)
      ..subtreeSeparation = (30)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }

  // Overriding the build method to return a widget tree
  @override
  Widget build(BuildContext context) {
    // Returning an InteractiveViewer widget if the listOfUsers property of the widget has less than 2 items and the headOfUser property of the widget is null
    // Otherwise, returning a GraphView widget
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

// Defining a class for the nodes of the graph
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
