import 'package:flutter/material.dart';
import 'package:simple_news_app/Views/search_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))

                ),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Image(
                        repeat: ImageRepeat.noRepeat,
                      // color: Theme.of(context),
                      image: AssetImage('assets/images/logo.png')
                        ),
                      ),
                  ),
                  Text('Welecome to NewsApp', style: TextStyle(fontSize: 32),) ,
                  SizedBox(height:5),
                  Text('where we fetch you top headlines all the time', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,)
                ],
              ),
            ) ,
            const SizedBox(height:  30,),
            Center(
              child: ElevatedButton(
                
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchView()),);},
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Let's get started", style: TextStyle(color: Colors.white, fontSize: 24),),),),
            )
            
          ],
        )
      ),
      
    );
  }
}