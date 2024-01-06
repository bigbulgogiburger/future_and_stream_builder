import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenFuture extends StatefulWidget {
  const HomeScreenFuture({super.key});

  @override
  State<HomeScreenFuture> createState() => _HomeScreenFutureState();
}

class _HomeScreenFutureState extends State<HomeScreenFuture> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );
    return Scaffold(
        body: FutureBuilder(
      future: getNumber(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // 데이터가 있을 때에 위젯렌더링
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'FutureBuilder',
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
    await Future.delayed(Duration(seconds: 3));
    final random = Random();
    // throw Exception('에러가 발생했습니다.');
    return random.nextInt(100);
  }
}
