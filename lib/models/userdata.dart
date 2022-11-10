import 'package:flutter/material.dart';
import 'package:random_users/models/user.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  TextStyle subTitleTextStyle = const TextStyle(
      color: Color(0xff303030), fontWeight: FontWeight.w500, fontSize: 22);
  TextStyle textStyle = const TextStyle(
      color: Colors.black45, fontWeight: FontWeight.w500, fontSize: 18);
  TextStyle titleTextStyle = const TextStyle(
      color: Color(0xff303030), fontWeight: FontWeight.w600, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff303030),
        elevation: 1,
        title: const Text(
          "User Details",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(args.imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${args.nameTitle} ${args.firstName} ${args.lastName}",
              style: const TextStyle(
                  color: Color(0xff303030),
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(args.email,
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            Container(
              padding: const EdgeInsets.all(30),
              height: MediaQuery.of(context).size.height * 0.72,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gender", style: subTitleTextStyle),
                      Text(
                        args.gender,
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age", style: subTitleTextStyle),
                      Text(
                        "${args.age}",
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Address", style: subTitleTextStyle),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${args.area}, ${args.city}, ${args.state}, ${args.country} ${args.pincode}",
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Contect Number", style: subTitleTextStyle),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    args.phone,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login Details",
                        style: titleTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Username", style: subTitleTextStyle),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    args.userName,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Password", style: subTitleTextStyle),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    args.password,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("UUID", style: subTitleTextStyle),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    args.uuid,
                    style: textStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
