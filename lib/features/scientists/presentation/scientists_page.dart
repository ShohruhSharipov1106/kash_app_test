import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:new_project/features/scientists/presentation/blocs/scientists_bloc/scientists_bloc.dart';

class ScientistsPage extends StatefulWidget {
  const ScientistsPage({super.key});

  @override
  State<ScientistsPage> createState() => _ScientistsPageState();
}

class _ScientistsPageState extends State<ScientistsPage> {
  late ScientistsBloc bloc;

  @override
  void initState() {
    bloc = ScientistsBloc()..add(GetScientistEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        body: Center(
          child: BlocBuilder<ScientistsBloc, ScientistsState>(
            builder: (context, state) {
              print("scientist => ${state.scientists.length}");
              if (state.status.isSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.scientists[index].firstName),
                      subtitle: Text(state.scientists[index].lastName),
                    );
                  },
                  itemCount: state.scientists.length,
                );
              } else if (state.status.isInProgress) {
                return Center(child: CupertinoActivityIndicator());
              } else {
                return Center(child: Text("Error"));
              }
            },
          ),
        ),
      ),
    );
  }
}
