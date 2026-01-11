import 'package:flutter/material.dart';
class MyCarts extends StatelessWidget {
  const MyCarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/AppleIcon.png",height:50,width:100,color: Colors.white),
        //title: Text("--- NIKHIL  APPLE  STORE ---",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black)),
        //centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.tealAccent,width: 2),
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 150,
                  width: 150,
                  child: (Image.asset("assets/images/abc.png",height:120,width: 200)
                ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.tealAccent,width: 2),
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  height: 150,
                  width: 150,
                  child: (Image.asset('assets/images/iphone 17.png',height:120,width: 200)
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("iPhone Air",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                Text("iphone 17",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                Text("Price: ₹110000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹80000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iphone-17pro.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/AirPods Pro 3.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("  iphone 17pro",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                Text("  AirPods Pro 3",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹140000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹25000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/AirPods Max.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iPad.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("AirPods Max     ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("iPad      ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹59000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹34000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Apple Watch Series 11.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iMac.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Apple Watch       ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:15),),
                Text("iMac       ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹46000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹134000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iPhone 13.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iPhone 14 Pro.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("   iPhone 13",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("  iPhone 14 Pro",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹42000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹120000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Powerbeats Fit.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/airpods-max.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Powerbeats Fit ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("Airpods-max  ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹24000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹59900.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Beats Pill.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/HomePod mini.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("    Beats Pill",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("   HomePod mini",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹16900.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹10000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/HomePod.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Powerbeats Pro 2.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("      HomePod",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("     Powerbeats Pro 2",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹32000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹29000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Apple Watch Ultra 3.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Beats Solo 4.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Apple Watch Ultra 3",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("    Beats Solo 4     ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹85000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹22000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Beats Flex.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/Beats Solo Buds.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("      Beats Flex",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("       Beats Solo Buds ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹5000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹6000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/iPhone 16.png',height:120,width: 200)
              ),
              ),Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.tealAccent,width: 2),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                width: 150,
                child: (Image.asset('assets/images/MagSafe Charger.png',height:120,width: 200)
              ),
              ),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("       iPhone 16 ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Text("       MagSafe Charger ",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Price: ₹69000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
                Text("Price: ₹5000.00",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black12),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
                ElevatedButton(onPressed: (){"Shop Now";}, child:Text("Buy",style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      ),
    );
  }
}