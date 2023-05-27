import 'package:app_starting/di/injection_init.dart';
import 'package:app_starting/sconde/screen/seconde_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/one_bloc.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  late OneBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState

    _bloc = getIt.get<OneBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneBloc(),
      child: BlocConsumer<OneBloc, OneState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.en == OneEnum.saveSuccess) {
            showDialog(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      Text('บันทึกแล้ว'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Close")),
                    ],
                  );
                },
                context: context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('One Screen')),
            body: Column(
              children: [
                Expanded(child: Text('Count => ${state.count}')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // BlocProvider.of<OneBloc>(context).add(AddEvent());
                          _bloc.add(AddEvent());
                        },
                        child: const Text("ADD (+)")),
                    ElevatedButton(
                        onPressed: () {
                          _bloc.add(ResetEvent(100));
                        },
                        child: const Text("Reset")),
                    ElevatedButton(
                        onPressed: () {
                          _bloc.add(MinusEvent());
                        },
                        child: const Text("Minus (-)"))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
