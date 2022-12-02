import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanager/cubit/list_elements_cubit.dart';

import 'cubit/click_cubit.dart';

void main() {
  runApp(const MyApp());
}

List<String> list = <String>[];

String text = text;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ClickCubit()),
        BlocProvider(create: (context) => ListElementsCubit()),
      ],
      child: BlocBuilder<ClickCubit, ClickState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter PR4',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const MyHomePage(),
            themeMode: state is WhiteTheme ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: <Widget>[
            BlocBuilder<ListElementsCubit, ListElementsState>(
              builder: (context, state) {
                if (state is CountedSize) {
                  return Text(
                    context.read<ClickCubit>().count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return const Text("");
              },
            ),
            BlocBuilder<ListElementsCubit, ListElementsState>(
              builder: (context, state) {
                int size = list.length;
                if (state is CountedSize) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          width: 30,
                          child: Center(
                              child: Text(
                            list.elementAt(index),
                          )),
                        );
                      },
                      itemCount: size,
                    ),
                  );
                }
                return const Text("Нажмите на одну из кнопок");
              },
            ),
            Spacer()
          ],
        )),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<ClickCubit>().Click();
                  context.read<ListElementsCubit>().ElementAdd();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<ClickCubit>().ClickMinus();
                  context.read<ListElementsCubit>().ElementAdd();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<ClickCubit>().SwapThere();
                  context.read<ListElementsCubit>().ElementAdd();
                },
                child: const Icon(Icons.change_circle),
              ),
            ],
          ),
        ));
  }
}
