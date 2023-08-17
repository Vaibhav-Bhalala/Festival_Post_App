import 'package:festval_post/screens/quotes_model.dart';
import 'package:festval_post/utils/quotes_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late List<Quotes> Quotedata;
  bool istoggled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Quotedata = quotelist.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent.withOpacity(0.60),
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        },
                        child: Text("Yes")),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("No")),
                  ],
                  content: Text(
                    "Are you sure to Exit???",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Festival Post"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.withOpacity(0.4),
          onPressed: () {
            setState(() {
              istoggled = !istoggled;
            });
          },
          child:
          Icon((istoggled == true) ? Icons.grid_3x3_rounded : Icons.list),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/abstract-watercolor-colorful-background_23-2149108517.jpg"),
                      fit: BoxFit.cover)),
            ),
            (istoggled == true)
                ? ListView.builder(
                itemCount: Quotedata.length,
                itemBuilder: (BuildContext context, int i) => Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'Detail_screen',
                          arguments: Quotedata[i]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pinkAccent,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://img.freepik.com/premium-vector/diwali-festival-patterned-background-vector_53876-163777.jpg"),
                            fit: BoxFit.cover,
                          )),
                      alignment: Alignment.center,
                      height: 200,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${Quotedata[i].quote}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent.withOpacity(0.85)),
                          ),
                          Text(
                            "- ${Quotedata[i].festival}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent.withOpacity(0.95)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
                : Scrollbar(
                radius: Radius.circular(10),
                interactive: true,
                thickness: 10,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                  itemBuilder: (BuildContext Context, int i) => GestureDetector(onTap: (){ Navigator.pushNamed(context, 'Detail_screen',
                      arguments: Quotedata[i]);},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pinkAccent,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.freepik.com/premium-vector/diwali-festival-patterned-background-vector_53876-163777.jpg"),
                              fit: BoxFit.cover)),
                      alignment: Alignment.center,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            child: Text(
                              "${Quotedata[i].quote}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueAccent.withOpacity(0.85)),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Text(
                            "- ${Quotedata[i].festival}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink.withOpacity(0.95)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}