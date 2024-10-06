import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/seekbar_example/seekbar_provider.dart';

class SeekbarScreen extends StatefulWidget {
  const SeekbarScreen({super.key});

  @override
  State<SeekbarScreen> createState() => _SeekbarScreenState();
}

class _SeekbarScreenState extends State<SeekbarScreen> {

  @override
  Widget build(BuildContext context) {

    print("build function call");

    // final provider = Provider.of<SeekbarProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi-Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SeekbarProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<SeekbarProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                      height: 100,
                      decoration:
                      BoxDecoration(
                          color: Colors.blue.withOpacity(value.value)
                      ),
                      child: const Center(
                          child: Text("Container 1")
                      ),
                    )),
                Expanded(
                    child: Container(
                      height: 100,
                      decoration:
                      BoxDecoration(
                          color: Colors.orange.withOpacity(value.value)
                      ),
                      child: const Center(
                          child: Text("Container 1")
                      ),
                    )),
              ],
            );
          }),

        ],
      ),
    );
  }
}
