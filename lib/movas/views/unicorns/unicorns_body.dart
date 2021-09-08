import 'package:flutter/material.dart';
import 'package:movas_demo_app/movas/actions/unicorns_action.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_observable.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_observable.dart';
import 'package:movas_demo_app/movas/views/unicorns/unicorn_dialog.dart';
import 'package:provider/provider.dart';

class UnicornsBody extends StatefulWidget {
  @override
  _UnicornsBodyState createState() => _UnicornsBodyState();
}

class _UnicornsBodyState extends State<UnicornsBody> {
  @override
  void initState() {
    UnicornsA.of(context).fetchUnicorns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UnicornsO>(
        builder: (_, unicornsO, __) => unicornsO == null
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: unicornsO.unicorns.length,
                itemBuilder: (_, index) => Column(
                  children: [
                    Text("ID: ${unicornsO.unicorns[index].id}"),
                    Text("Name: ${unicornsO.unicorns[index].name}"),
                    Text("Color: ${unicornsO.unicorns[index].color}"),
                    Text("Age: ${unicornsO.unicorns[index].age}"),
                    IconButton(
                      onPressed: () {
                        UnicornsA.of(context)
                            .deleteUnicorn(unicornsO.unicorns[index].id!);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => Divider(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => UnicornDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
