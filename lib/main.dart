import 'package:flutter/material.dart';

import 'helpers/APi.dart';
import 'models/user.dart';
import 'models/userdata.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'userpage': (context) => DataPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>?> fetchedData;
  TextEditingController searchController = TextEditingController();
  bool dataEnter = false;
  @override
  initState() {
    super.initState();
    fetchedData = APIHelper.apiHelper.getUsersDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff303030),
        elevation: 1,
        actions: [
          Transform.scale(
            scale: 0.6,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                dataEnter = !dataEnter;
                setState(() {});
              },
              icon: dataEnter
                  ? const Icon(
                      Icons.close,
                      size: 50,
                    )
                  : const Icon(Icons.search_rounded, size: 50),
            ),
          ),
        ],
        title: (dataEnter)
            ? Container(
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: const Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onSubmitted: (val) {
                    if (val.isNotEmpty) {
                      try {
                        dataCount = int.parse(val);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Enter Valid Value...")));
                      }
                      setState(() {
                        fetchedData = APIHelper.apiHelper.getUsersDataList();
                      });
                      searchController.clear();
                      dataEnter = false;
                    } else {
                      dataEnter = false;
                    }
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: "Enter user amount you want...",
                    border: InputBorder.none,
                  ),
                ),
              )
            : const Text(
                "Random User Generator",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
          future: fetchedData,
          builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                children: snapshot.data!
                    .map((e) => Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("userpage", arguments: e);
                              // Navigator.pushNamed(context, "datapage",arguments: e);
                            },
                            isThreeLine: true,
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(e.imageUrl),
                            ),
                            title: Text(
                              "${e.nameTitle} ${e.firstName} ${e.lastName}",
                              softWrap: true,
                            ),
                            subtitle:
                                Text("${e.email}\n${e.city},${e.country}"),
                            trailing: Text(e.gender),
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff303030),
                ),
              );
            }
          }),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
