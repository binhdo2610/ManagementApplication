import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(     
        child: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text(
                'DUMAHH',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'manh.tech',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Joined 5 Months ago',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton.icon(onPressed: (){},
              icon: Row(
                
              children: [
                Icon(Icons.person),
                SizedBox(height: 5),
              ],
              ),

              label: Text(
                'Personality',
                style: TextStyle(
                  fontSize: 16)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(311, 65),
                backgroundColor: Color.fromARGB(220, 248, 226, 216),       
              ), 
              ),
              SizedBox(height: 20),
              
              SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    );
  }
}