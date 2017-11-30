// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/browser_client.dart';

var wordList;

 main() async{
  querySelector('#getData').onClick.listen(makeRequest);
  
  wordList = querySelector('#wordList');

  var client = new BrowserClient();
  var url = 'http://localhost:90/data/add';
  var response =
      await client.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  
}

Future makeRequest(Event e) async {
  var path='http://localhost:90/data/';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

void processString(String jsonString) {
  List<String> portmanteaux = JSON.decode(jsonString) as List<String>;
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

void handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}


