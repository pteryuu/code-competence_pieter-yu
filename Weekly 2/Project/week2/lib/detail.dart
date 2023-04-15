import 'package:flutter/material.dart';
import 'package:week2/style.dart';

class DetailPage extends StatefulWidget {
  String firstName;
  String lastName;
  String email;
  String help;
  DetailPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.help});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail App')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Thanks ${widget.firstName} ${widget.lastName}',
                  style:
                      blackTextStyle.copyWith(fontSize: 25, fontWeight: bold),
                ),
                const Text('We appreciate your feedback.')
              ]),
        ),
      ),
    );
  }
}
