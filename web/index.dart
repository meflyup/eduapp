// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:http/browser_client.dart';

main() async {
  querySelector('#getData').onClick.listen(makeRequest);

  querySelector('#postData').onClick.listen(makePostRequest);

  wordList = querySelector('#wordList');
}

var wordList;

void handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}

Future makeRequest(Event e) async {
  var path = 'http://localhost:90/data/';
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

Future makePostRequest(Event e) async {
  String url = 'http://localhost:90/data/add';
  HttpRequest
      .request(url, method: 'POST', sendData: '''{'user':'zhangsan'}''')
      .then((HttpRequest resp) {
    // Do something with the response.
    querySelector('#response').text = resp.responseText;
  });
}
