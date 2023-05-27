import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../one/bloc/one_bloc.dart';

class SecondeScreen extends StatefulWidget {
  const SecondeScreen({super.key});

  @override
  State<SecondeScreen> createState() => _SecondeScreenState();
}

class _SecondeScreenState extends State<SecondeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondeScreen')),
      body: BlocBuilder<OneBloc, OneState>(
        bloc: BlocProvider.of<OneBloc>(context),
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Text('SecondeScreen ${state.count}'),
                ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<OneBloc>(context).add(AddEvent()),
                    child: Text("ADD"))
              ],
            ),
          );
        },
      ),
    );
  }
}
