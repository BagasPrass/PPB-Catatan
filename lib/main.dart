import 'package:catatan/catatan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatatanPage(),
    );
  }
}

class CatatanPage extends StatefulWidget {
  const CatatanPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => CatatanState();
}

TextEditingController judulController = TextEditingController();
TextEditingController isiController = TextEditingController();

class CatatanState extends State<CatatanPage> {
  List<Catatan> listCatatan = Catatan.dataDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan Pagi"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: judulController,
              decoration: const InputDecoration(hintText: "Judul"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: isiController,
              decoration: const InputDecoration(hintText: "Catatan"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        judulController.text = '';
                        isiController.text = '';
                      });
                    },
                    child: const Text("Clear", style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    if (judulController.text != '' &&
                        isiController.text != '') {
                      setState(() {
                        listCatatan.add(
                            Catatan(judulController.text, isiController.text));
                        judulController.text = '';
                        isiController.text = '';
                      });
                    }
                  },
                  child: const Text("Submit", style: TextStyle(fontSize: 18)),
                )),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: listCatatan.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listCatatan[index].judul,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8.0),
                      Text(listCatatan[index].isi,
                          style: const TextStyle(
                            fontSize: 18,
                          )),
                    ]),
              );
            },
          ))
        ],
      ),
    );
  }
}
