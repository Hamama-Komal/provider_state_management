import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  StatelessScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
   ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Widget as Statefull"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (BuildContext context, value, Widget? child) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffix: InkWell(
                        child: Icon(
                            _toggle.value ? Icons.visibility_off : Icons.visibility
                        ),
                        onTap: (){
                          _toggle.value = !_toggle.value;
                        },)
                  ),
                ),
              );
            },
          ),
          /*Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, value, Widget? child) {
                return Text("Counter: ${_counter.value}",
                style: TextStyle(fontSize: 30)
                  ,);
              },)
          ),*/
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
         onPressed: () {
           _counter.value++;
           print(_counter.value.toString());
         },
        child: Icon(
          Icons.add
        ),
      ),*/
    );
  }
}
