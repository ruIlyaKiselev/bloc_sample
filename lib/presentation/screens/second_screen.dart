import 'package:bloc_sample/logic/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
    required this.title,
    required this.color
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  State createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times:"),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Was Incremented!!!"), duration: Duration(microseconds: 100),));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Was Decremented!!!"), duration: Duration(microseconds: 100),));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                      "Negative value: ${state.counterValue.toString()}");
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                      "Odd value value: ${state.counterValue.toString()}");
                } else {
                  return Text(
                      "Regular value: ${state.counterValue.toString()}");
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    tooltip: "Decrement",
                    child: const Icon(Icons.remove),
                    onPressed: () =>
                    {
                      BlocProvider.of<CounterCubit>(context).decrement()
                    }
                ),
                FloatingActionButton(
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                    onPressed: () =>
                    {
                      BlocProvider.of<CounterCubit>(context).increment()
                    }
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      "/third"
                  );
                },
                child: const Text(
                  "To the third screen!!!",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(widget.color),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}