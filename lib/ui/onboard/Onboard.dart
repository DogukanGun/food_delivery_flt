import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../../res/color_resource.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final GoogleSignInAccount _currentUser ;
  String _contactText = '';

  String _status = "";
  void _signInAnon() async {
    UserCredential user = await _auth.signInAnonymously();
    if(user.user != null) {
      setState(() {
        _status = 'Signed in Anonymously';
      });
    } else {
      setState(() {
        _status = 'Sign in failed!';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account!;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
    json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
          (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
            (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    primary: ColorResource.button_primary_color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                  ),
                  child:const  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Login With Gmail"),
                  ),
                ),
              ),
            ],
          ),
          Text(_contactText),
          Row(
            children: [
              Expanded(
                child:
                ElevatedButton(
                  onPressed: (){
                    _signInAnon();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorResource.button_primary_color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                  ),
                  child:const  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Login Anonymously"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//swipe indicataar scrool indicattar texfiedl mask