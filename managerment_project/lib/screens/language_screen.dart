import 'package:flutter/material.dart';
import 'package:managerment_project/style/button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        
        
      ),   
      body: Center(
        child: Column(
          children: [        
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 100, 0),        
              child: Text('Language', style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Opacity(
                  opacity: 0.5,
                  child: Text('Your settings so that we are comfortable', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,        
                  ),),
                )
            ),
            SizedBox(height: 100,),
            ElevatedButton(onPressed:(){} ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFF0E9),            
              minimumSize: Size(377,65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text('Vietnamese', style: TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Color(0xFFFD6B22)
            ),),
            ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed:(){} ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 236, 232, 255),            
              minimumSize: Size(377,65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text('English', style: TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Color(0xFF5835FB)
            ),),
            ),
            SizedBox(height: 100,),
            ElevatedButton(onPressed:(){} ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF20B9FC),            
              minimumSize: Size(377,65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text('Save', style: TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Color(0xFFFFFFFF)
            ),),
            ),
          ],
          
        ),
      ),
    );
  }
}