import 'package:flutter/material.dart';
import 'package:week1/contact_form.dart';
import 'package:week1/detail.dart';
import 'package:week1/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController help = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Competence 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Welcome Back!\n${firstName.text} ${lastName.text}',
            style: blackTextStyle.copyWith(fontSize: 25, fontWeight: bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Text(
              'Contact us',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ),
          RichText(
              text: TextSpan(
                  text:
                      'Need to get in touch with us? Either fill out the form with your inquiry or find the ',
                  style: blackTextStyle,
                  children: [
                TextSpan(
                    text: 'department email',
                    style: primaryTextStyle.copyWith(
                        decoration: TextDecoration.underline)),
                TextSpan(
                    text: ' you\'d like to contact below',
                    style: blackTextStyle),
              ])),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Name',
                            style: blackTextStyle,
                          ),
                          ContactForm(
                              lines: 1,
                              controller: firstName,
                              onChanged: (val) {
                                setState(() {
                                  val = firstName.text;
                                });
                              }),
                        ])),
                const Padding(padding: EdgeInsets.only(left: 5)),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: blackTextStyle,
                      ),
                      Container(
                        child: ContactForm(
                            lines: 1,
                            controller: lastName,
                            onChanged: (val) {
                              setState(() {
                                val = lastName.text;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Email',
              style: blackTextStyle,
            ),
            ContactForm(
                lines: 1,
                controller: email,
                onChanged: (val) {
                  setState(() {
                    val = email.text;
                  });
                }),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'What can we help you with?',
                style: blackTextStyle,
              ),
              Container(
                child: ContactForm(
                    lines: 5,
                    controller: help,
                    onChanged: (val) {
                      setState(() {
                        val = help.text;
                      });
                    }),
              ),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: email.text,
                            help: help.text,
                          )));
            },
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          )
        ]),
      ),
    );
  }
}
