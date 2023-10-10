import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  _launchURL() async {
    const url = 'https://sophia.chat/'; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://mail.google.com/chat/u/0/#onboarding'; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[bgColor1, bgColor2],
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                  Row(
                    children: [

                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const FaIcon(FontAwesomeIcons.circleArrowLeft, size: 30,)
                      ),

                      const SizedBox(width: 20,),

                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 30
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),


                  CircleAvatar(
                    radius: 52,
                    backgroundColor: headingColor,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: FaIcon(FontAwesomeIcons.userLarge, color: Colors.black, size: 40,),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(40)),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Verified User',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20
                              ),
                            ),

                            SizedBox(width: 5,),

                            FaIcon(FontAwesomeIcons.check, size: 20, color: Colors.green,),
                          ],
                        ),

                        const SizedBox(height: 10,),
                        const Divider(thickness: 1.5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Name:',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Aryan Gupta',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'E-mail id:   ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text(
                                    'aryan@gmail.com',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Phone No: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                    ),
                                  ),

                                  Text(
                                    '+91 92XXXXXXXX',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      _launchURL(); // Call the function to open the link

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Chat with an AI',style: TextStyle(fontSize: 30),),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(onPressed: (){}, icon: IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble,size: 35,))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      _launchURL2(); // Call the function to open the link

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Start a Private Chat',style: TextStyle(fontSize: 20),),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(onPressed: (){}, icon: IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble,size: 35,))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
