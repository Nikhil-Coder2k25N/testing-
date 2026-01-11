import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Crossfile extends StatefulWidget {
  const Crossfile({super.key});
  @override
  State<Crossfile> createState() => _CrossfileState();
}
class _CrossfileState extends State<Crossfile> {
  final List<String> product_image=[
    'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-3-hero-select-202509?wid=532&hei=582&fmt=png-alpha&.v=cmp4MmZ6OWxOeHNNTXh4SzlBNUpEb1RucE9zZTI5eEREaWZpY29lSld3eG5ybFVoUG5ONDlkK2JkbHErdVFSNVM0TjRWdzF2UjRGVEY0c3dBQVZ6VFk1ZmVZeDNxQ3ljaDhwR2JKTTZHaDg',
    'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MQDP3?wid=532&hei=582&fmt=png-alpha&.v=ekdNWGRyOTZjVmxDTTNjRzZ6ZnIzZ0hqc0NvK2RZTVd5TWVhUDFuQlo0MDB0Y0lkeVg2OHRld3lCWVNZZVFRRXVTbDlvM1pMVlNzZEJDMFh0bDl2RlE',
    'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGFL4?wid=532&hei=582&fmt=png-alpha&.v=YWNwdnh5aVNHd2tXL000dFJnTExHQUhqc0NvK2RZTVd5TWVhUDFuQlo0MGFCQ016dk4ydDRZN05UbHM4bXd2dkc5aEdmRHJIUnZvK2Z6S1p3czJHVUE'
  ];
  final List<String> product_name=[
    'assets/images/AirPods Max.png',
    'assets/images/iMac.png',
    'assets/images/iPad.png',
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
       // backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset("assets/images/AppleIcon.png",height:50,width:100,color: Colors.white),
          //title: Text("--- NIKHIL  APPLE  STORE ---",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black)),
          //centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            CarouselSlider(
                items: product_name.map((url){
                  return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(url,
                            //fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      }
                  );
                }).toList(),
                options:CarouselOptions(

                  height:200,
                  enlargeCenterPage:true,
                  autoPlay:true,
                )
            )
          ],
        )
    );
  }
}
