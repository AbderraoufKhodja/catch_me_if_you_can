import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PassPage extends StatefulWidget {
  const PassPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  Size get _size => MediaQuery.of(context).size;
  final dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade200,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: Colors.black)),
        title: const Text(
          '详情',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onLongPress: () {},
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          children: [
            Column(
              children: [
                appBar(),
                buildHeader(),
              ],
            ),
            Expanded(child: buildFooter()),
          ],
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '您当前扫码时间: ${dateTimeNow()}',
          style: const TextStyle(fontSize: 20),
        ),
        const Text(
          '您当前扫码位置:校东南门_进校通道_1',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          '离测距点距离:51米',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  String dateTimeNow() =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  Column buildHeader() {
    return Column(
      children: [
        Text(DateFormat.MMMd('zh_hans').format(dateTime),
            style: const TextStyle(fontSize: 40)),
        const CurrentTimeWidget(),
        Image.asset(
          'assets/WeChat Image_20221014170211.jpg',
          width: _size.width,
          fit: BoxFit.fill,
        ),
        const Text(
          '浙江师范大学返校码',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        const Text(
          '进校扫码',
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: const Color.fromARGB(255, 21, 154, 245),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Christina Garcia',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '70053569',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '500-美术学院算机科学学院',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '人员类别:教师 13-脱产博士后',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '返校状态:允许返校',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 76, 220, 99),
                    radius: 30,
                    child: Text(
                      '绿码',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class CurrentTimeWidget extends StatefulWidget {
  const CurrentTimeWidget({Key? key}) : super(key: key);

  @override
  State<CurrentTimeWidget> createState() => CurrentTimeWidgetState();
}

class CurrentTimeWidgetState extends State<CurrentTimeWidget> {
  DateTime currentTime = DateTime.now();

  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.Hms().format(currentTime),
      style: const TextStyle(fontSize: 45),
    );
  }
}
