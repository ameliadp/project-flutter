import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedValue;
  final List items = [
    {
      'judul': 'Skincare',
      'data': 1,
    },
    {
      'judul': 'Cosmetics',
      'data': 2,
    },
    {
      'judul': 'Accessories',
      'data': 3,
    },
  ];

  late int dataAwal;

  @override
  void initState() {
    dataAwal = items[0]['data'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataAwal = items[0]['data'];
    return Scaffold(
      key: _scaffoldKey,
      //AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 232, 223),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/images/pink-a.png',
          ),
        ),
        title: Text('A Cosme'),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontFamily: 'Urbanist',
          color: Colors.white,
        ),
        titleSpacing: 5,
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Dropdown
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: DropdownButton<String>(
                    hint: Text('All'),
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['Skincare', 'Cosmetics', 'Accessories']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList()),
              ),
            ),
            //ListView Box
            Align(
              alignment: Alignment.center,
              child: Card(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text('Box ${index + 1}'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Dialog Button
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          title: Text('Ini Judul'),
                          content:
                              Text('Ini deskripsi dialog. Silahkan dibaca bro'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('CANCEL'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OKAY'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Show Dialog',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Urbanist Regular',
                          color: Color(0xffff80d0)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff73ebdc),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Snackbar Button
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Halo! Aku SnackBar.'),
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(
                      'Show Snack Bar',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Urbanist Regular',
                          color: Color(0xffff80d0)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff73ebdc),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Bottom Sheet Button
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          color: Colors.white,
                          child: ListView(
                            children: [
                              ListTile(
                                onTap: () => print('object'),
                                leading: Icon(Icons.add_outlined),
                                title: Text('Add'),
                              ),
                              ListTile(
                                onTap: () => print('object'),
                                leading: Icon(Icons.create_sharp),
                                title: Text('Edit'),
                              ),
                              ListTile(
                                onTap: () => print('object'),
                                leading: Icon(Icons.search),
                                title: Text('Search'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Show Bottom Sheet',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Urbanist Regular',
                          color: Color(0xffff80d0)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff73ebdc),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //Drawer
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 142, 232, 223),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Page Drawer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffff80d0),
                        fontFamily: 'Urbanist Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
              ),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text(
                'Login',
              ),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.person_add_alt),
              title: Text(
                'Contact Person',
              ),
              onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }
}
