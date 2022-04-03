import 'package:flutter/cupertino.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

Widget myButtons() {
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FacebookButton(
        onPressed: () {
          _launchURL('https://www.facebook.com/carelsscoder/');
        },
      ),
      // TwitterButton(
      //   onPressed: () {
      //     _launchURL('url');
      //   },
      // ),
      GithubButton(
        onPressed: () {
          _launchURL('https://github.com/sarojyadav88505');
        },
      ),
      InstagramButton(
        onPressed: () {
          _launchURL('https://www.instagram.com/vipcoding/');
        },
      ),
      LinkedinButton(
        onPressed: () {
          _launchURL('https://www.linkedin.com/in/saroj-yadav-b69311111/');
        },
      ),
      GoogleButton(
        onPressed: () {
          _launchURL('http://carelesscoder.com/');
        },
      ),
    ],
  );
}
