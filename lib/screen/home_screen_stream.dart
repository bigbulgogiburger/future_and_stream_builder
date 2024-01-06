import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenStream extends StatefulWidget {
  const HomeScreenStream({super.key});

  @override
  State<HomeScreenStream> createState() => _HomeScreenStreamState();
}

class _HomeScreenStreamState extends State<HomeScreenStream> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );
    return Scaffold(
        body: StreamBuilder<int>(
          stream: streamNumbers(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'StreamBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Constate: ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'data: ${snapshot.data}',
                  style: textStyle,
                ),

                Text(
                  'error: ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                )
              ],
            );
          },
        ));
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 1));
    final random = Random();
    // throw Exception('에러가 발생했습니다.');
    return random.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if(i==5){
        throw Exception('i=5');
      }
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
