import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:week2/component/contact_form.dart';
import 'package:week2/detail.dart';
import 'package:week2/style.dart';
import 'package:week2/view/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Container(
          height: 50,
          width: 90,
          child: Image.asset(
            'assets/alterra.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      endDrawer: Drawer(
          child: ListView(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'About Us',
              style: primaryTextStyle,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Contact Us',
              style: primaryTextStyle,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: primaryTextStyle,
            ),
          ),
        ],
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroWidget(),
                //Section 2
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          'Contact us',
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: bold),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: blackTextStyle,
                                      ),
                                      ContactForm(
                                          lines: 1,
                                          controller: prov.firstName,
                                          onChanged: (val) {
                                            prov.updateFirstName(val);
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
                                        controller: prov.lastName,
                                        onChanged: (val) {
                                          prov.updateLastName(val);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: blackTextStyle,
                            ),
                            ContactForm(
                                lines: 1,
                                controller: prov.email,
                                onChanged: (val) {
                                  setState(() {
                                    val = prov.email.text;
                                  });
                                }),
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What can we help you with?',
                                style: blackTextStyle,
                              ),
                              Container(
                                child: ContactForm(
                                    lines: 5,
                                    controller: prov.help,
                                    onChanged: (val) {
                                      setState(() {
                                        val = prov.help.text;
                                      });
                                    }),
                              ),
                            ]),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        firstName: prov.firstName.text,
                                        lastName: prov.lastName.text,
                                        email: prov.email.text,
                                        help: prov.help.text,
                                      )));
                        },
                        icon: const Icon(Icons.send),
                        label: Text(
                          'Send',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'About us',
                                style: blackTextStyle.copyWith(
                                    fontSize: 20, fontWeight: bold),
                              ),
                              Text(
                                'Alterra Academy Programs',
                                style: blackTextStyle.copyWith(
                                    fontSize: 15, fontWeight: bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CourseCard(
                              name: 'Immersive Program',
                              desc:
                                  'Program pelatihan coding bootcamp intensif bagi kamu yang pemula, baik dengan latar belakang IT maupun Non-IT, untuk menjadi Engineer profesional dalam waktu 9 Minggu.',
                            ),
                            CourseCard(
                              name: 'Flexi',
                              desc:
                                  'Bootcamp dengan waktu belajar yang flexible, solusi untuk kamu yang masih bekerja dan mempunyai kegiatan rutin tetapi ingin pindah karir di Bidang Digital.',
                            ),
                            CourseCard(
                              name: 'ALTA.id | Online Learning Platform',
                              desc:
                                  'Alta.id merupakan platform pembelajaran untuk kalian yang ingin menjadi engineer berkualitas. Setiap kelas dapat diakses kapan saja dengan format belajar hybrid.',
                            ),
                          ],
                        ),
                      ),
                      // ListView.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: 3,
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, index) {
                      //     return Row();

                      //   },
                      // ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  String? name;
  String? desc;
  CourseCard({super.key, required this.name, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                    'https://academy.alterra.id/wp-content/uploads/2021/07/dashboard.svg'),
                Text('$name',
                    textAlign: TextAlign.center,
                    style: name!.length >= 20
                        ? blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: bold)
                        : blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold)),
                Text(
                  '$desc',
                  textAlign: TextAlign.justify,
                  style: blackTextStyle.copyWith(
                      fontSize: 10, fontWeight: regular),
                )
              ]),
        ),
      ),
    );
  }
}

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      // constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Coding Bootcamp Penghasil\nProgrammer dengan Kualitas\nTinggi di Indonesia',
                textAlign: TextAlign.center,
                style: whiteTextStyle.copyWith(
                    fontSize: 20, fontWeight: extraBold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  'Alterra Academy adalah coding bootcamp\nIndonesia untuk semua orang, baik dengan background IT & non IT untuk menjadi\nProgrammer dengan kualitas terbaik di\nIndustri saat ini',
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                      fontSize: 15, fontWeight: semiBold)),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Pelajari lebih lanjut',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: black),
              ),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  backgroundColor: const Color(0xFFEE9D40)),
            )
          ]),
    );
  }
}
