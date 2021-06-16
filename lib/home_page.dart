import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menu = [
    'Bunga',
    'Pot',
  ];

  List dataMenu = [
    //index bunga
    [
      {
        'nama': 'Matahari',
        'harga': '20000',
      },
      {
        'nama': 'Tulip',
        'harga': '50000',
      },
      {
        'nama': 'Mawar',
        'harga': '20000',
      }
    ],

    //index Pot
    [
      {
        'nama': 'Kecil',
        'harga': '20000',
      },
      {
        'nama': 'Besar',
        'harga': '50000',
      },
      {
        'nama': 'Sedang',
        'harga': '20000',
      },
      {
        'nama': 'Gede Banget',
        'harga': '200000',
      },
    ],
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView dengan If'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTab = index;
                      });
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color:
                            currentTab == index ? Colors.green : Colors.white,
                        border: Border.all(
                            color: currentTab == index
                                ? Colors.green
                                : Colors.black),
                      ),
                      child: Text(menu[index]),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (MediaQuery.of(context).size.width - 135) /
                    (MediaQuery.of(context).size.width),
              ),
              itemCount: dataMenu[currentTab].length,
              itemBuilder: (context, index) {
                return Container(
                  // width: 300,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              dataMenu[currentTab][index]['nama'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  dataMenu[currentTab][index]['harga']
                                      .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
