import 'package:flutter/material.dart';
import 'package:flutter_apptest3/screen/contacts.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      Slide(
        title: "Vimigo Assessment",
        description: "By : NurNasuha Binti Amar",
        pathImage: "assets/logo.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      currentSlide.pathImage.toString(),
                      matchTextDirection: true,
                      height: 160,
                      width: 160,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    child: Text(
                      currentSlide.title.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      currentSlide.description.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(60, 5, 60, 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      tileColor: Colors.red[600],
                      leading: Icon(Icons.sort, color: Colors.white,),
                      title: Text('Sort Contact',
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(60, 15, 60, 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      tileColor: Colors.red[600],
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Search Contact',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(60, 10, 60, 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      tileColor: Colors.red[600],
                      leading: const Icon(
                        Icons.add_call,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Add New Contact',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      renderSkipBtn: Text(
        "Skip",
        style: TextStyle(color: Colors.black),
      ),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(color: Colors.black),
      ),
      renderDoneBtn: const Text(
        "Done",
        style: TextStyle(color: Colors.black),
      ),
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      //shouldHideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Contacts(),
        ),
      ),
    );
  }
}
