import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:shesafe/screens/calculator.dart';
import 'package:shesafe/screens/login_screens/login_screen.dart';
import 'package:shesafe/screens/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  final String apiU = 'http://192.168.29.193:5000/send_alert'; // Replace with your Flask API endpoint
  final String fixedRecipientNumber = '+919354101897'; // Replace with your fixed recipient number

  Future<void> sendAlert() async {
    try {
      final response = await http.post(
        Uri.parse(apiU),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'recipient_number': fixedRecipientNumber}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final messageSid = data['message_sid'];

        // Handle success, you can display a message or take further actions
        print('Alert message sent to fixed recipient. SID: $messageSid');
      } else {
        // Handle error
        print('Failed to send alert: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }
  final String apiUrl = 'http://192.168.29.193:5000/make_call'; // Replace with your Flask API endpoint
  Future<void> makeEmergencyCall() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: '{}', // An empty JSON object as the body
      );

      if (response.statusCode == 200) {
        // Handle success, you can display a message or take further actions
        print('Emergency call initiated.');
      } else {
        // Handle error
        print('Failed to make the emergency call. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _launchURL1() async {
    const url = "tel://10920"; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = "tel://(011) 24373736"; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL3() async {
    const url = "tel://7827170170"; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL4() async {
    const url = "tel://1091"; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL5() async {
    const url = 'https://www.domesticshelters.org/en-in/domestic-abuse-help-in-india'; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL6() async {
    const url = "tel://011 26692700"; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL7() async {
    const url = 'http://www.menwelfare.in/'; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL8() async {
    const url = 'https://www.daaman.org/'; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[


                //HOME PAGE
                //HOME PAGE
                //HOME PAGE
                //HOME PAGE
                //HOME PAGE
                //HOME PAGE
                //HOME PAGE
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        topRow(),
                        SizedBox(height: 10,),
                        Text('EMERGENCY',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Center(child: Text('The type of severity you select will act and inform the respective authorities',style: TextStyle(fontSize: 15,),)),
                        const SizedBox(
                          height: 10,
                        ),


                        //LOW

                        GestureDetector(
                          onTap: (){
                            sendAlert();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                            child: const Center(
                              child: Text(
                                'LOW',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        //high

                        GestureDetector(
                          onTap: (){makeEmergencyCall();},
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                            height: 150,
                            child: const Center(
                              child: Text(
                                'HIGH',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),


                        //severe

                        GestureDetector(
                          onTap: (){
                            sendAlert();
                            makeEmergencyCall();
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                            height: 150,
                            child: const Center(
                              child: Text(
                                'SEVERE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                //VIDEOS PAGE
                //VIDEOS PAGE
                //VIDEOS PAGE
                //VIDEOS PAGE
                //VIDEOS PAGE
                //VIDEOS PAGE
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text('RESOURCES',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('You can refer these resources in case of any help you will need:',style: TextStyle(fontSize: 20),),
                      ),
                      Text('Youtube Videos on Self-Defence',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: 'ERMZRMqQmVI',
                                      flags: const YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: true,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.blue,
                                    progressColors: const ProgressBarColors(
                                        playedColor: Colors.blue,
                                        handleColor: Colors.blueAccent
                                    ),
                                  ),
                                ),
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: 'S32KxQK0Ydg',
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blue,
                                  progressColors: const ProgressBarColors(
                                      playedColor: Colors.blue,
                                      handleColor: Colors.blueAccent
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: '70vtcFQwnVM',
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blue,
                                  progressColors: const ProgressBarColors(
                                      playedColor: Colors.blue,
                                      handleColor: Colors.blueAccent
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: 'pndPbpHLpos',
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blue,
                                  progressColors: const ProgressBarColors(
                                      playedColor: Colors.blue,
                                      handleColor: Colors.blueAccent
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('NGOs',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL5();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                'Domestic Shelters',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL6();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                'Jagori NGO',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL7();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                "Men's Welfare",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL8();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                "Daaman",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Helpline Numbers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL1();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                'Shakti Shalini: 10920',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL2();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                "Women's shelter: 24373736",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL3();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                "National Commission for Women Helpline: 7827170170",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            _launchURL4();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            // Remove default padding
                          ),
                          child: Ink(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [bgColor1, bgColor2], // Gradient colors
                                begin: Alignment.topLeft, // Gradient start position
                                end: Alignment.bottomRight, // Gradient end position
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0), // Add padding to the container
                              child: Text(
                                "Police Helpline: 1091",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                //CONTACTS PAGE
                //CONTACTS PAGE
                //CONTACTS PAGE
                //CONTACTS PAGE
                //CONTACTS PAGE
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'Close Contacts',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                        Text('Select who should be contacted'),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Mom',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Dad',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sister',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Brother',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Aryan',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Anas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'RK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Saransh',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: headingColor,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Shivli',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),


                const ProfilePage(),


              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 20,

        containerHeight: 60,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 18),
            ),
            textAlign: TextAlign.center,
            inactiveColor: Colors.black,
            activeColor: headingColor,
            icon: const FaIcon(FontAwesomeIcons.house),
          ),
          BottomNavyBarItem(
            title: const Text(
              'Videos',
              style: TextStyle(fontSize: 18),
            ),
            textAlign: TextAlign.center,
            inactiveColor: Colors.black,
            activeColor: headingColor,
            icon: const FaIcon(FontAwesomeIcons.youtube),
          ),
          BottomNavyBarItem(
            title: const Text(
              'Contacts',
              style: TextStyle(fontSize: 18),
            ),
            textAlign: TextAlign.center,
            inactiveColor: Colors.black,
            activeColor: headingColor,
            icon: const FaIcon(
              FontAwesomeIcons.phone,
            ),
          ),
          BottomNavyBarItem(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 18),
            ),
            textAlign: TextAlign.center,
            inactiveColor: Colors.black,
            activeColor: headingColor,
            icon: const FaIcon(FontAwesomeIcons.userLarge),
          ),
        ],
      ),
    );
  }


  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              'Current Location',
              style: TextStyle(
                color: Color(0xffb20202),
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                Icon(
                  Icons.location_on,
                  size: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Hyderabad, India',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          icon: Icon(Icons.calculate_outlined,size: 40,)
        ),
      ],
    );
  }

}
