import 'package:flutter/material.dart';
import 'package:user_tracking/gsm.dart';
import 'package:user_tracking/service.dart';
import 'package:user_tracking/view_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Gsm>> futureGsm;

  @override
  void initState() {
    super.initState();
    futureGsm = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Panel"),
      ),
      body: Center(
        child: FutureBuilder<List<Gsm>>(
          future: futureGsm,
          builder: (BuildContext context, AsyncSnapshot<List<Gsm>> snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data;
              return ListView.builder(
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(list[index].manufacturer),
                        subtitle: Text(list[index].model),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewMap(
                                latitude: list[index].latitude,
                                longitude: list[index].longitude,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
