import 'dart:ffi';

import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  Map<String, List<String>> plan;
  Plan({Key? key, required this.plan}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.plan.length,
        itemBuilder: (BuildContext context, int index){
          return _buildColumn(widget.plan.keys.elementAt(index), widget.plan.values.elementAt(index));
        }
    );
  }

  Widget _buildColumn(String title, List<String> exercises){
    return Column(
        children: <Widget>[
          Text(title),
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: exercises.length,
              itemBuilder: (BuildContext context, int index){
                return Expanded(
                    child: Text(exercises[index])
                );
              }
          )
        ]
    );
  }
}

