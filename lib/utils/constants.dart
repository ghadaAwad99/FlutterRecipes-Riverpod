import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

const Locale arabicLocale = Locale('ar');
const Locale englishLocale = Locale('en');
const List<Locale> localeList = [englishLocale, arabicLocale];

const suggestionsNumber = 5;
const addRecipeInformation = true;

const lunch = "lunch";
const salad = "salad";
const dessert = "dessert";

const searchDebounce = 'debounce';

int offset =1;

launchURL({required String url}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    showErrorMessage('Could not launch $url');
  }
}

shareUrl({required String title, String? url}){
  FlutterShare.share(
      title: title,
      linkUrl: url ?? ""
  );
}

showErrorMessage(String errorMessage) {
  Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}